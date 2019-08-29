import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "../utils.dart" as utils;
import "TasksModel.dart";

class TasksDBWorker {
  TasksDBWorker._();
  static final TasksDBWorker db = TasksDBWorker._();

  Database _db;
  Future get database async {
    if (_db == null) {
      _db = await init();
    }
    return _db;
  }

  Future<Database> init() async {
    String path = join(utils.docsDir.path, "Tasks.db");
    Database db = await openDatabase(
      path, version : 1, onOpen : (db) { },
      onCreate : (Database inDB, int inVersion) async {
        await inDB.execute(
          "CREATE TABLE IF NOT EXISTS Tasks ("
            "id INTEGER PRIMARY KEY,"
            "description TEXT,"
            "dueDate TEXT,"
            "completed TEXT"
          ")"
        );
      }
    );
    return db;
  }

  Task TaskFromMap(Map inMap) {
    Task Task = Task();
    Task.id = inMap["id"];
    Task.description = inMap["description"];
    Task.dueDate = inMap["dueDate"];
    Task.completed = inMap["completed"];
    return Task;
  }

  Map<String, dynamic> TaskToMap(Task inTask) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = inTask.id;
    map["description"] = inTask.description;
    map["dueDate"] = inTask.dueDate;
    map["completed"] = inTask.completed;
    return map;
  }

  Future create(Task inTask) async {
    Database db = await database;
    var val = await db.rawQuery( "SELECT MAX(id) + 1 AS id FROM Tasks" );
    int id = val.first["id"];
    if (id == null) { id = 1; }
    return await db.rawInsert(
      "INSERT INTO Tasks (id, description, dueDate, completed) "
      "VALUES (?, ?, ?, ?)",
      [ id, inTask.description, inTask.dueDate, inTask.completed ]
    );
  }

  Future<Task> get(int inID) async {
    Database db = await database;
    var rec = await db.query( "Tasks", where : "id = ?", whereArgs : [ inID ] );
    return TaskFromMap(rec.first);
  }

  Future<List> getAll() async {
    Database db = await database;
    var recs = await db.query("Tasks");
    var list = recs.isNotEmpty ? recs.map((m) => TaskFromMap(m)).toList() : [ ];
    return list;
  }

  Future update(Task inTask) async {
    Database db = await database;
    return await db.update("Tasks", TaskToMap(inTask), where : "id = ?", whereArgs : [ inTask.id ] );
  }


  Future delete(int inID) async {
    Database db = await database;
    return await db.delete( "Tasks", where : "id = ?", whereArgs : [ inID ] );
  }

}