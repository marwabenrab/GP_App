//import 'package:falah/screens/components/task_form.dart';
import 'package:flutter/material.dart';

import 'taskform.dart';
class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context, 
        builder: (BuildContext context){
        return const TaskForm();
        },
        ),
        backgroundColor: Colors.green,
      
        child: const Icon(Icons.add),
      
      );
  }
}