import 'package:flutter/material.dart';
import 'package:simpletodo/todo_model.dart';

class Todoboxes extends StatelessWidget {
  const Todoboxes({
    super.key,
    required this.todo,
    required this.doneFunction,
  });

  final Todo todo;
  final void Function()? doneFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      todo.text, //todo text
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            //mark button
            ElevatedButton(
              onPressed: doneFunction,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(60, 60),
                  backgroundColor: Colors.grey),
              child: const Icon(
                Icons.done_outline_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
