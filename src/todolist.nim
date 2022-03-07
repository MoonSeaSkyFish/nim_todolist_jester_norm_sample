import jester
import controllers

template response(text: ResponseText) =
  resp $text

template response(url: RedirectText) =
  redirect $url

routes:
  get "/":
    response top()
  get "/deploy":
    response deploy()
  get "/regist":
    response regist(request)
  get "/del/@id":
    response remove(@"id")
