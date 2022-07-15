#!/bin/bash
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
if [[ -z $TF_VAR_panoptica_access_key ]]||[[ $TF_VAR_panoptica_access_key == "<access-key>" ]]; then echo "ACCESS KEY Not set!!!"; exit 1; fi
if [[ -z $TF_VAR_panoptica_secret_key ]]||[[ $TF_VAR_panoptica_secret_key == "<secret-key>" ]]; then echo "SECRET KEY Not set!!!"; exit 1; fi
if [[ $VAR_Username == "YOUR-EMAIL-Address" ]]; then echo "Your Email is Not set!!!"; exit 1; fi
if [[ $VAR_Username =~ $regex ]]; then echo "Verification Successful! Please continue..."; sh /home/developer/src/dne-appsec/submit.sh 2 $VAR_Username $DEVENV_APP_8080_URL $DEVENV_INSTANCE_ID $DEVENV_USER; else echo "Please provide a valid email address"; fi
