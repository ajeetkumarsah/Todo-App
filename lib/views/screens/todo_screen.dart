import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/data/model/todo_model.dart';
import 'package:todo_app/views/screens/todo_form_screen.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: GoogleFonts.inter(),
        ),
      ),
      body: Obx(() {
        if (controller.todoLists.isEmpty) {
          return const Center(child: Text('No todos yet.'));
        }

        return ListView.builder(
          itemCount: controller.todoLists.length,
          itemBuilder: (context, i) {
            final ToDoModel item = controller.todoLists[i];
            return Dismissible(
              key: Key(item.title),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (v) {
                //

                controller.deleteTodo(item);
                Get.showSnackbar(const GetSnackBar(
                  title: 'Item is deleted!',
                  message: 'deleted successfully!',
                  snackStyle: SnackStyle.FLOATING,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: ListTile(
                  title: Text(
                    item.title,
                    style: GoogleFonts.inter(),
                  ),
                  subtitle: Text(
                    item.description ?? '',
                    style: GoogleFonts.inter(),
                  ),
                  trailing: Text(
                    '${item.dueDate?.day}-${item.dueDate?.month}-${item.dueDate?.year}',
                    style: GoogleFonts.inter(),
                  ),
                  //  Checkbox(
                  //   value: item.isCompleted,
                  // onChanged: (value) {
                  //   controller.updateTodoStatus(item,
                  //       value! ? TodoStatus.completed : TodoStatus.todo);
                  // },
                  // ),
                  onTap: () => Get.to(() => TodoFormScreen(todo: item)),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => Get.to(
          () => TodoFormScreen(),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
