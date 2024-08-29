import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/model/todo_model.dart';

class TodoController extends GetxController {
  late Box todoBox;
  //list

  RxList todoLists = <ToDoModel>[].obs;

  List<String> todoStatus = ['Active', 'Progress', 'Completed'];

  //
//String
  String get selectedStatus => _selectedStatus;
  String _selectedStatus = '';
  @override
  void onInit() {
    super.onInit();
    todoBox = Hive.box('todo');

    loadTodoList();
  }

  void loadTodoList() {
    //to load the list from the stored
    todoLists.value = List<ToDoModel>.from(todoBox.values);
  }

  void addTodo({required String title, required String decs, DateTime? date}) {
    ToDoModel item = ToDoModel(
        title: title,
        description: decs,
        status: selectedStatus,
        dueDate: date ?? DateTime.now().add(const Duration(days: 2)));

    todoBox.putAt(0, item.toJson());
  }

  void deleteTodo(int index) {
    todoBox.delete(index);
    todoLists.refresh();
  }

  void onChnageStatus(String value) {
    _selectedStatus = value;
    update();
  }
}
