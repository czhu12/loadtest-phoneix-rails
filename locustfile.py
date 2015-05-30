from locust import HttpLocust, TaskSet, task

class MessageTasks(TaskSet):
  @task(10)
  def index(l):
    l.client.get("/messages")

  @task(1)
  def create(l):
    l.client.post("/messages", {
      "user": "Test",
      "body": "Hello world"
    })
  
class WebsiteUser(HttpLocust):
  host = "http://127.0.0.1:4000"
  min_wait = 2000
  max_wait = 2500
  task_set = MessageTasks
