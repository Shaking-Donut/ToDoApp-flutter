import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo_types.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required this.todo, required this.callback});

  final Todo todo;
  final Function(Todo newTodo) callback;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? _dateDue;

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.todo.title;
    _descController.text = widget.todo.desc;
    _dateDue = widget.todo.dateDue;
  }

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
              'Szczegóły',
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
            child: ElevatedButton(
              onPressed: () {
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
                    });
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 18,
                    ),
                    Text(
                      _dateDue != null
                          ? DateFormat.yMMMd().format(_dateDue!)
                          : ' Nie ustawiono',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.callback(Todo(
                isChecked: widget.todo.isChecked,
                dateCreated: widget.todo.dateCreated,
                todoId: widget.todo.todoId,
                title: _titleController.text,
                desc: _descController.text,
                dateDue: _dateDue,
              ));
              Navigator.pop(context);
            },
            child: const Text('Zatwierdź zmiany'),
          ),
          Padding(
            padding: MediaQuery.of(context).viewInsets,
          ),
        ],
      ),
    );
  }
}
