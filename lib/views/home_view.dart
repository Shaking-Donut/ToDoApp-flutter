import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/model/todo_types.dart';
import 'package:todo/views/widgets/todo_sliver.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: Consumer<TodoModel>(builder: (context, todo, child) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TodoSliver(
                      todo: todo.todos[index],
                      callback: (Todo newTodo) {
                        todo.update(newTodo);
                      },
                    );
                  },
                  childCount: todo.todos.length,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
