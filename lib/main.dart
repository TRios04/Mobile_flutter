import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'package:lista_de_tarefas/provider/tasks_provider.dart';
import 'package:lista_de_tarefas/widgets/task.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TODO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tasks = 0;

  void _incrementTasks() {
    setState(() {
      _tasks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(
            create: (context) => (TasksProvider()))
      ],
      child: Consumer<TasksProvider>(
        builder: (BuildContext context, TasksProvider value, Widget? child) =>
            Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Column(
            children: (() {
              List<Widget> listTask = [];
              value.tasks.forEach((element) {
                listTask.add(Task(id: element.id, name: element.title));
              });
              return listTask;
            })(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              _incrementTasks();
              String title = "";
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Nome da task'),
                      content: TextField(
                        textInputAction: TextInputAction.go,
                        onChanged: (value) {
                          title = value;
                        },
                        onSubmitted: (value) {
                          title = value;
                          Navigator.pop(context);
                        },
                      ),
                    );
                  });
              Provider.of<TasksProvider>(context, listen: false)
                  .addTask(TaskModel(id: _tasks, title: title));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
