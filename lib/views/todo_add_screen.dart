import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo_types.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key, required this.callback});

  final Function(Todo newTodo) callback;

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateDueController = TextEditingController();
  final String _todoId = Random.secure().toString();
  DateTime? _dateDue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Utwórz nowe przypomnienie',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: AppColors.gray8,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Tytuł',
                hintText: 'Tutaj wpisz tytuł przypomnienia',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Opis',
                hintText: 'Tutaj wpisz krótki opis przypomnienia',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _dateDueController,
              decoration: const InputDecoration(
                // labelText: 'Data',
                hintText: 'Nie ustawiono',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: _dateDue != null ? _dateDue! : DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 360)),
                  cancelText: 'Anuluj',
                  confirmText: 'Zatwierdź',
                ).then(
                  (pickedDate) {
                    if (pickedDate == null) {
                      return;
                    }
                    setState(() {
                      _dateDue = pickedDate;
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(_dateDue!);
                      _dateDueController.text = formattedDate;
                    });
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text('Anuluj'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.callback(Todo(
                    isChecked: false,
                    dateCreated: DateTime.now(),
                    todoId: _todoId,
                    title: _titleController.text,
                    desc: _descController.text,
                    dateDue: _dateDue,
                  ));
                  Navigator.pop(context);
                },
                child: const Text('Utwórz'),
              ),
            ],
          ),
          Padding(
            padding: MediaQuery.of(context).viewInsets,
          ),
        ],
      ),
    );
  }
}
