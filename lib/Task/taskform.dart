//import 'package:falah/models/task.dart';
//import 'package:falah/providers/task_provider.dart';
import 'package:flutter/material.dart';

//import 'task.dart';
//import 'taskprovider.dart';
//import 'package:provider/provider.dart';
class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formkey = GlobalKey<FormState>();
  final taskTitle = TextEditingController();//bach dakhel text
  @override
  Widget build(BuildContext context) {
    return AlertDialog(//lkhana li tekteb fiha task jdid
      content: Stack(
        clipBehavior: Clip.none,//bach x tbanelna lfo9a f tarf ko mandirohach l x takhtafi
        children: [
          const Positioned(
            right: -40,
            top: -40,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.close),
            ),
            ),
            Form(
              key: _formkey,//lazem nhoto hada l key 
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: taskTitle,
                      decoration: const InputDecoration(
                        hintText: 'add task title...',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: const Text('Add task'),
                      onPressed: ()  {
                        if(_formkey.currentState!.validate())
                        {
                          /*Navigator.of(context).pop();
                          context.read<TaskProvider>().addTask(
                          Task(
                            title: taskTitle.text,
                            completed: false,
                            ));*/
                          
                          
                        }
                      }
                        
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}