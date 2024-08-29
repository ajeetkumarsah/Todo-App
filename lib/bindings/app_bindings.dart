import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //

    Get.lazyPut<TodoController>(() => TodoController());
  }
}
