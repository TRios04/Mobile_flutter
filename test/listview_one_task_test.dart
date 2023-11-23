import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/main.dart';
import 'package:lista_de_tarefas/provider/task_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

@GenerateMocks([TaskProvider])
void main() {
  testWidgets("Should show one task, if one exists", (tester) async {
    MockTaskProvider mockTaskProvider = MockTaskProvider();
    
    when(mockTaskProvider.tasks).thenReturn(tasks);

    Widget myApp = MultiProvider(
      providers: [ChangeNotifierProvider<TaskProvider>(create: (_) => mockTaskProvider)],
      child: MaterialApp(
        home: MyHomePage(
          title: 'Test',
        ),
      ),
    );
  
    tester.pumpWidget(myApp);
    
    expect(find.text("Task"), findsOneWidget); 
  });
}