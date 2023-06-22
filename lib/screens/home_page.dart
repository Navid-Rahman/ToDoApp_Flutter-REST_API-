import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_restapi_flutter/screens/add_task.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => const AddTodoPage(),
    );
    Navigator.push(context, route);
  }

  Future<void> deleteById(String id) async {
    // TODO: Delete the item
    final url = '';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    //TODO: Remove the item from the current list
  }

  // TODO: API GET Call

  Future<void> fetchTodo() async {
    const url = 'https://api.nstack.in/v1/todos?$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    } else {}

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  item['title'],
                ),
                subtitle: Text(
                  item['description'],
                ),
                trailing: PopupMenuButton(onSelected: (value) {
                  if (value == 'edit') {
                    // Edit page
                  } else if (value == 'delete') {
                    // Delete page
                    deleteById(id);
                  }
                }, itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      child: Text('Edit'),
                      value: 'edit',
                    ),
                    const PopupMenuItem(
                      child: Text('Delete'),
                      value: 'delete',
                    ),
                  ];
                }),
              );
            },
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Todo',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF79E0EE),
      ),
    );
  }
}
