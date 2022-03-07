import models
import views
import jester
import strutils

type
  ResponseText* = distinct string
  RedirectText* = distinct string

proc `$`*(s: ResponseText): string {.borrow.}
proc `$`*(s: RedirectText): string {.borrow.}

proc top*(): ResponseText =
  ResponseText(topPage(getTaskAll()))

proc deploy*(): ResponseText =
  initModel()
  ResponseText(messagePage("sucess create table"))

proc regist*(request: Request): RedirectText =
  addTask(request.params["task"])
  RedirectText("/")

proc remove*(id: string): RedirectText =
  try:
    let id = parseInt(id)
    delTask(id)
  except:
    discard
  RedirectText("/")


