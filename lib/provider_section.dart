import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:simpletodo/objectbox.g.dart';
import 'package:simpletodo/todo_model.dart';

class TodoboxR extends ChangeNotifier {
  // late final Store store;
  // late final Box<Todo> _todoBox;

  // List<Todo> todos =
  //     []; // including <Todo> means this list can only store Todo items

  // // Initialize objectbox
  // Future<void> initialize() async {
  //   final docsDir = await getApplicationDocumentsDirectory();
  //   final store = await openStore(
  //     directory: path.join(docsDir.path,
  //         "objectbox"), // this creates a folder called object box where the data is saved
  //   );

  //   _todoBox = Box<Todo>(store);
  //   _loadTodos();
  // }

  late final Store store;
  late final Box<Todo> todoStoreBox;
  List todolist = [];

  Future<void> initialize() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: path.join(docsDir.path, "objectbox")); // this creates a folder called object box where the data is saved
    todoStoreBox = store.box();
    _loadTodos();
  }

  void _loadTodos() {
    todolist = todoStoreBox.getAll();
    notifyListeners();
  }

  void addTask(String task) {
    final todo = Todo(text: task);
    todoStoreBox.put(todo);
    _loadTodos();
  }

  void doneTask(int index) {
    final todo = todolist[index];
    todoStoreBox.remove(todo.id);
    _loadTodos();
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }
}
