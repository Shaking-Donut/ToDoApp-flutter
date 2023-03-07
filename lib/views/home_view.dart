import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo_types.dart';
import 'package:todo/views/widgets/todo_sliver.dart';

List<Todo> todoList = [
  Todo(
    isChecked: false,
    dateCreated: DateTime(2023, 3, 29),
    title: 'Zrobić zakupy',
    todoId: '861239',
    dateDue: DateTime(2023, 3, 31),
    desc: 'Wejdz do lidla',
  ),
  Todo(
    isChecked: true,
    dateCreated: DateTime(2023, 3, 29),
    title: 'Zabrać bombelka z przedszkola',
    todoId: '861239',
    dateDue: DateTime(2023, 3, 31),
    desc: 'Przedszkole nr. 20',
  ),
  Todo(
    isChecked: false,
    dateCreated: DateTime(2023, 3, 29),
    title: 'Zejbać ci kopa',
    todoId: '861239',
    dateDue: DateTime(2023, 3, 31),
  ),
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 28,
          color: AppColors.gray8,
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text.rich(
          TextSpan(children: [
            TextSpan(text: 'Cześć, '),
            // TODO: username
            TextSpan(
                text: 'Tanya!', style: TextStyle(fontWeight: FontWeight.w500)),
          ]),
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return TodoSliver(todo: todoList[index]);
                },
                childCount: todoList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
