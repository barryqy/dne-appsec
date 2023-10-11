"""
Escher auth plugin for HTTPie.
"""
import os
import sys
from urllib.parse import urlparse

from httpie.plugins import AuthPlugin

from escherauth.escherauth import EscherRequestsAuth

__version__ = '0.2.0'
__author__ = 'Julien Barbot'
__license__ = 'Cisco'

KEY = 'SECURECN_CLI_ACCESS_KEY'
SECRET = 'SECURECN_CLI_SECRET_KEY'

class EscherAuthRequestWrapper(object):
    def __init__(self, scope, options, escher_client):
        self._e = EscherRequestsAuth(scope, options, escher_client)

    def __call__(self, r):
        parsed_uri = urlparse(r.url)
        r.headers['Host'] = parsed_uri.netloc

        apisec_req = r.copy()
        apisec_req.url = '/api/serviceMe'
        apisec_req.method = 'GET'
        apisec_req.body = None
        apisec_signed_req = self._e(apisec_req)

        r.headers['APISEC-AUTH'] = 'escher'
        r.headers['X-Escher-Auth'] = apisec_signed_req.headers['X-Escher-Auth']
        r.headers['X-Escher-Date'] = apisec_signed_req.headers['X-Escher-Date']

        return r

class EscherAuthPlugin(AuthPlugin):
    name = 'Escher auth'
    auth_type = 'apisec_escher'
    description = 'Set the right format for Escher auth request'
    auth_require = False
    prompt_password = False

    def get_auth(self, username=None, password=None):
        if username is None:
            username = os.environ.get(KEY)
        if password is None:
            password = os.environ.get(SECRET)

        if username is None or password is None:
            sys.exit(ExitStatus.PLUGIN_ERROR)

        if "/" in username:
            scope = username.split("/")
            escher_key = scope.pop()
            scope = "/".join(scope)

        escher_client = {'api_key': escher_key, 'api_secret': password}

        options = {}
        return EscherAuthRequestWrapper(scope, options, escher_client)
