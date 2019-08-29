import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "TasksDBWorker.dart";
import "TasksModel.dart" show Task, TasksModel, TasksModel;


class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future _deleteTask(BuildContext inContext, Task inTask) {
        return showDialog(
          context : inContext,
          barrierDismissible : false,
          builder : (BuildContext inAlertContext) {
            return AlertDialog(
              title : Text("Delete Task"),
              content : Text("Are you sure you want to delete ${inTask.description}?"),
              actions : [
                FlatButton(child : Text("Cancel"),
                  onPressed: () {Navigator.of(inAlertContext).pop();}
                ),
                FlatButton(child : Text("Delete"),
                  onPressed : () async {
                    await TasksDBWorker.db.delete(inTask.id);
                    Navigator.of(inAlertContext).pop();
                    Scaffold.of(inContext).showSnackBar(
                      SnackBar(
                        backgroundColor : Colors.red,
                        duration : Duration(seconds : 2),
                        content : Text("Task deleted")
                      )
                    );
                    TasksModel.loadData("Tasks", TasksDBWorker.db);
                  }
                )
              ]
            );
          }
        );
      }


     return ScopedModel<TasksModel>(

        model : tasksModel,
        child : ScopedModelDescendant<TasksModel>(

                builder : (BuildContext inContext, Widget inChild, TasksModel inModel) {

                  return Scaffold( 

                    floatingActionButton : FloatingActionButton(
                                              child : Icon(Icons.add, color : Colors.white),
                                              onPressed : () {
                                                TasksModel.entityBeingEdited = Task();
                                                TasksModel.setColor(null);
                                                TasksModel.setStackIndex(1);
                                              }
                                            ),

                    body : ListView.builder(
                              itemCount : TasksModel.entityList.length,
                              itemBuilder : (BuildContext inBuildContext, int inIndex) {
                                Task Task = TasksModel.entityList[inIndex];
                                Color color = Colors.white;
                                  switch (Task.color) {
                                    case "red" :    color = Colors.red; break;
                                    case "green" :  color = Colors.green; break;
                                    case "blue" :   color = Colors.blue; break;
                                    case "yellow" : color = Colors.yellow; break;
                                    case "grey" :   color = Colors.grey; break;
                                    case "purple" : color = Colors.purple; break;
                                  }       
                                return Container(

                                  padding : EdgeInsets.fromLTRB(20, 20, 20, 0),

                                  child : Slidable(

                                    delegate : SlidableDrawerDelegate(),
                                    actionExtentRatio : .25,
                                    secondaryActions : [
                                      IconSlideAction(
                                        caption : "Delete",
                                        color : Colors.red,
                                        icon : Icons.delete,
                                        onTap : () => _deleteTask(inContext, Task)
                                      )
                                    ],
                                    child : Card(
                                          elevation : 8, color : color,
                                          child : ListTile(
                                            title : Text("${Task.description}"),
                                            subtitle : Text("${Task.content}"),
                                            onTap : () async {
                                              TasksModel.entityBeingEdited =await TasksDBWorker.db.get(Task.id);
                                              TasksModel.setColor(TasksModel.entityBeingEdited.color);
                                              TasksModel.setStackIndex(1);
                                            }
                                          )
                                        )
                                  ));   


                              }         
                        ),
                  );
                
                }
        ),   
     );       

  }
}