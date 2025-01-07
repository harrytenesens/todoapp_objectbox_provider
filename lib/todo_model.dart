import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id()
  int id = 0; // ObjectBox will automatically handle IDs

  String text;
  bool isDone;

  Todo({
    required this.text,
    this.isDone = false,
  });
}