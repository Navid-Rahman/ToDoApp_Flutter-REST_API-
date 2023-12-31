import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;
  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'];
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF46B5D1),
          foregroundColor: const Color(0xFFFFFFFF),
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
            navigateEdit(item);
          } else if (value == 'delete') {
            // Delete page
            deleteById(id);
          }
        }, itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ];
        }),
      ),
    );
  }
}
