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
    resp deploy()
  get "/del/@id":
    remove(@"id")
    redirect "/"
