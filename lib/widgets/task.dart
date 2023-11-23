import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/provider/task_provider.dart';
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  final int id;
  final String name;

  const Task({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Text("$id - $name"),
            ],
          ),
          Spacer(),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TaskProvider>(context, listen: false)
                        .deleteTask(id);
                  },
                  child: Icon(Icons.delete_forever_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}
