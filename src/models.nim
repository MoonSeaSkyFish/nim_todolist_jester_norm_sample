import norm/[model, sqlite]

const DBName = "todolist.sqllite3"

type
  Task* = ref object of Model
    task*: string

func newTask*(task: string = ""): Task =
  Task(task: task)

template modelProc*(dbconn: untyped, statments: untyped): untyped =
  var dbconn = open(DBName, "", "", "")
  statments
  dbconn.close

proc initModel*() =
  modelProc(db):
    db.createTables(newTask())

