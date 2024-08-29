import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  DateTime? dueDate;

  @HiveField(3)
  bool isCompleted = false;

  @HiveField(4)
  DateTime? createdAt;

  @HiveField(5)
  TodoStatus status = TodoStatus.todo;
}

@HiveType(typeId: 1)
enum TodoStatus {
  @HiveField(0)
  todo,

  @HiveField(1)
  active,

  @HiveField(2)
  inProgress,

  @HiveField(3)
  completed,
}
