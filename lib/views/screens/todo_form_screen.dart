import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/data/model/todo_model.dart';

// ignore: must_be_immutable
class TodoFormScreen extends StatelessWidget {
  final ToDoModel? todo;

  TodoFormScreen({super.key, this.todo});

  final TodoController controller = Get.find();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    if (todo != null) {
      titleController.text = todo!.title;
      descriptionController.text = todo!.description ?? '';
      selectedDate = todo!.dueDate;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(todo == null ? 'Add Todo' : 'Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            // DropdownButton<String>(
            //   value: controller.selectedStatus,
            //   items: controller.todoStatus
            //       .map((String v) => DropdownMenuItem<String>(
            //             value: v,
            //             child: Text(v),
            //           ))
            //       .toList(),
            //   onChanged: (v) {},
            // ),
            Row(
              children: [
                Text(
                    'Due Date: ${selectedDate != null ? selectedDate!.toLocal().toString().split(' ')[0] : 'Not Set'}'),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    selectedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                final newTodo = todo ?? ToDoModel();
                newTodo.title = titleController.text;
                newTodo.description = descriptionController.text;
                newTodo.dueDate = selectedDate;
                newTodo.isCompleted = todo?.isCompleted ?? false;
                newTodo.createdAt = todo?.createdAt ?? DateTime.now();
                newTodo.status = TodoStatus.active;

                if (todo == null) {
                  controller.addTodo(newTodo);
                } else {
                  newTodo.save();
                  controller.todoLists.refresh();
                }

                Get.back();
              },
              child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurple,
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
