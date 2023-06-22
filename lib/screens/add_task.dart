import 'package:flutter/material.dart';
import 'package:todo_restapi_flutter/services/todo_service.dart';
import 'package:todo_restapi_flutter/utils/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({
    super.key,
    this.todo,
  });

  final Map? todo;

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];

      titleController.text = title;
      descriptionController.text = description;
    }
  }

  Future<void> updateData() async {
    // Get the data from the server

    final todo = widget.todo;
    if (todo == null) {
      print('You can not call Update without todo data');
      return;
    }

    final id = todo['_id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    final isSuccess = await TodoService.updateTodo(id, body);

    // Show sucess of fail message based on status
    if (isSuccess) {
      showSuccessMessage(context, message: 'Successfully updated');
    } else {
      showErrorMessage(context, message: 'Failed creation');
    }
  }

  Future<void> saveData() async {
    // TODO: Get the data from the form

    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    // TODO: Save data to the server

    final isSuccess = await TodoService.saveTodo(body);

    // TODO: Show success or fail message based on status
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: 'Successfully created');
    } else {
      showErrorMessage(context, message: 'Failed creation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Todo' : 'Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: isEdit ? updateData : saveData,
            child: Text(
              isEdit ? 'Update' : 'Save',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
