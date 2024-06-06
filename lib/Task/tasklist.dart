//import 'package:falah/providers/task_provider.dart';
import 'package:flutter/material.dart';

//import 'taskprovider.dart';
//import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    //final taskProvider = context.watch<TaskProvider>();
    var taskProvider;
    return Expanded(
      child: Container(
        child: Container(
          child: ListView.builder(//kon kanet thabta matetghayerch nsta3mlo listview brk bsh ki rah ttghayer nzido .builder
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index){
              return Container(
                child: Dismissible(
                  key: Key(index.toString()),
                  background: Container(
                    //color: Theme.of(context).errorColor,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                      ),
                      alignment: Alignment.centerRight,//bach tban f limna lokan mandirohach matekhrejch hata 3la tali 
                      padding: const EdgeInsets.only(right: 20),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction){
                    taskProvider.removeTask(index);
                  },
                  child: ListTile(
                    title: Text(taskProvider.tasks[index].title ,
                    style: 
                    const TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: Image(
                      image: taskProvider.tasks[index].completed
                      ? const AssetImage('images/check_5610944.png')//if true green
                      : const AssetImage('images/check-mark_1442912.png')//if false gray
                      ),
                      onTap: () {
                        taskProvider.makeTaskCompleted(index);
                      },
                  ),
                ),
              );
            } ,
            ),
            margin: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
      flex: 5,
    );
  }
}