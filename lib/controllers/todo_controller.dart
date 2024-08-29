import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/model/todo_model.dart';

class TodoController extends GetxController {
  final Box<ToDoModel> todoBox = Hive.box<ToDoModel>('todos');

  //list

  RxList todoLists = <ToDoModel>[].obs;

  List<String> todoStatus = ['Active', 'Progress', 'Completed'];

  //
//String
  String get selectedStatus => _selectedStatus;
  final String _selectedStatus = '';
  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  void loadTodos() {
    todoLists.assignAll(todoBox.values.toList());
  }

  void addTodo(ToDoModel item) {
    todoBox.add(item);
    todoLists.add(item);
  }

  void updateTodoStatus(ToDoModel item, TodoStatus status) {
    item.status = status;
    item.save();
    todoLists.refresh();
  }

  void deleteTodo(ToDoModel item) {
    item.delete();
    todoLists.remove(item);
  }

  void clearCompletedTodos() {
    todoBox.values.where((item) => item.isCompleted).forEach((item) {
      item.delete();
    });
    loadTodos();
  }
}
