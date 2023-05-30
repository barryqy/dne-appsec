################################################
# Run "pip install locust" before running python
################################################
from locust import HttpUser, task, between


class YelbUser(HttpUser):

    @task(3)
    def chipotle(self):
        self.client.get("/api/chipotle")
        self.client.get("/api/getvotes")

    @task
    def ihop(self):
        self.client.get("/api/ihop")
        self.client.get("/api/getvotes")

    @task(2)
    def outback(self):
        self.client.get("/api/outback")
        self.client.get("/api/getvotes")

    @task
    def bucadibeppo(self):
        self.client.get("/api/bucadibeppo")
        self.client.get("/api/getvotes")