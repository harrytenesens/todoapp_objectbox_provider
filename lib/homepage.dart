import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpletodo/provider_section.dart';
import 'package:simpletodo/todoboxes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoboxR>(
      builder: (context, todoclass, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Heading
                const Center(
                  child: Text(
                    'To Do Lists',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(height: 20),
                // the todo boxes
                Expanded(
                  child: ListView.builder(
                      itemCount: todoclass.todolist.length,
                      itemBuilder: (context, index) {
                        return Todoboxes(
                          todo: todoclass.todolist[index],
                          doneFunction: () => todoclass.doneTask(index),
                        );
                      }),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => todoclass.addTask('New task'),
            child: const Icon(Icons.task_alt),
          ),
        ),
      ),
    );
  }
}
