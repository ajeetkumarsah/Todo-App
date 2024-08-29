import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/data/model/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

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
      body: GetBuilder<TodoController>(
        init: TodoController(),
        initState: (_) {},
        builder: (ctlr) {
          return ListView.builder(
            itemCount: ctlr.todoLists.length,
            itemBuilder: (_, i) {
              ToDoModel item = ctlr.todoLists[i];
              return Dismissible(
                key: Key(item.title ?? '$i'),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (v) {
                  //

                  ctlr.deleteTodo(i);
                  Get.showSnackbar(
                      const GetSnackBar(title: 'Item is deleted!'));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    title: Text(
                      item.title ?? '',
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${item.dueDate.toLocal().day - item.dueDate.toLocal().month - item.dueDate.toLocal().year}',
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          item.description ?? '',
                          style: GoogleFonts.inter(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      item.status ?? '',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: (item.status != null &&
                                item.status!.startsWith('Active'))
                            ? Colors.green
                            : Colors.yellow,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
