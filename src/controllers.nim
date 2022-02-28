import norm/sqlite
import models
import views
import jester

proc top*(): string =
  var tasks = @[newTask()]
  modelProc(db):
    db.selectAll(tasks)
  result = topPage(tasks)

proc deploy*(): string =
  initModel()
  result = messagePage("sucess create table")

proc regist*(request: Request) =
  var tasks = [newTask(request.params["task"])]
  modelProc(db):
    db.insert(tasks)

proc remove*(id: string) =
  var tasks = @[newTask()]
  modelProc(db):
    db.select(tasks, "id = ?", id)
    db.delete(tasks)
