import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo_types.dart';
import 'package:todo/views/todo_screen.dart';

class TodoSliver extends StatefulWidget {
  const TodoSliver({super.key, required this.todo, required this.callback});

  final Todo todo;
  final Function(Todo newTodo) callback;

  @override
  State<TodoSliver> createState() => _TodoSliverState();
}

class _TodoSliverState extends State<TodoSliver> {
  @override
  Widget build(BuildContext context) {
    String formattedCreateDate =
        DateFormat.yMMMd().format(widget.todo.dateCreated);
    String formattedDueDate = widget.todo.dateDue != null
        ? DateFormat.yMMMd().format(widget.todo.dateDue!)
        : '';

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: ((context) => TodoScreen(
                todo: widget.todo,
                callback: (newTodo) {
                  widget.callback(newTodo);
                },
              )),
        );
      },
      child: SizedBox(
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
                        value: widget.todo.isChecked,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        onChanged: (newState) {
                          widget.callback(Todo(
                            dateCreated: widget.todo.dateCreated,
                            isChecked: newState!,
                            title: widget.todo.title,
                            todoId: widget.todo.todoId,
                            dateDue: widget.todo.dateDue,
                            desc: widget.todo.desc,
                          ));
                          setState(() {});
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
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (widget.todo.desc.isNotEmpty)
                            Text(
                              widget.todo.desc,
                              style: const TextStyle(
                                color: AppColors.gray5,
                                fontWeight: FontWeight.w300,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedCreateDate,
                        style: const TextStyle(
                          color: AppColors.gray5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        formattedDueDate,
                        style: const TextStyle(
                          color: AppColors.gray5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
