import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo_types.dart';

class TodoSliver extends StatefulWidget {
  const TodoSliver({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoSliver> createState() =>
      // ignore: no_logic_in_create_state
      _TodoSliverState(isChecked: todo.isChecked);
}

class _TodoSliverState extends State<TodoSliver> {
  bool? isChecked;

  _TodoSliverState({this.isChecked});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMd().format(widget.todo.dateCreated);

    return SizedBox(
      height: 82,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.background3,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (newState) {
                        setState(() {
                          isChecked = newState;
                        });
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.todo.title,
                          style: const TextStyle(
                            color: AppColors.gray7,
                          ),
                        ),
                        if (widget.todo.desc.isNotEmpty)
                          Text(
                            widget.todo.desc,
                            style: const TextStyle(
                              color: AppColors.gray5,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(formattedDate)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
