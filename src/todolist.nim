import jester
import controllers

routes:
  get "/":
    resp top()
  get "/deploy":
    resp deploy()
  get "/regist":
    regist(request)
    redirect "/"
  get "/del/@id":
    remove(@"id")
    redirect "/"
