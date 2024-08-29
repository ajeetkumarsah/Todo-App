import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class TodoFormScreen extends StatelessWidget {
  TodoFormScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleCtlr = TextEditingController();
  final TextEditingController _descCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TodoController>(
        init: TodoController(),
        initState: (_) {},
        builder: (ctlr) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleCtlr,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) return null;
                    return 'Field can\'t be empty';
                  },
                ),
                TextFormField(
                  controller: _descCtlr,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                DropdownButton<String>(
                  value: ctlr.selectedStatus,
                  items: ctlr.todoStatus
                      .map((String v) => DropdownMenuItem<String>(
                            value: v,
                            child: Text(v),
                          ))
                      .toList(),
                  onChanged: (v) {},
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //
                      ctlr.addTodo(
                        title: _titleCtlr.text,
                        decs: _descCtlr.text,
                      );
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                          title: 'Enter the required fields!'));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.inter(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
