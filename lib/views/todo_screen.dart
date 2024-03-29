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
  final TextEditingController _dateDueController = TextEditingController();
  DateTime? _dateDue;

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.todo.title;
    _descController.text = widget.todo.desc;
    _dateDue = widget.todo.dateDue;
    if (_dateDue != null) {
      _dateDueController.text = DateFormat('dd-MM-yyyy').format(_dateDue!);
    }
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
