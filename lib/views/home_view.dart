import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/colors.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/model/todo_types.dart';
import 'package:todo/views/todo_add_screen.dart';
import 'package:todo/views/widgets/todo_sliver.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

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
            TextSpan(
                text: 'Kacper!', style: TextStyle(fontWeight: FontWeight.w500)),
          ]),
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      floatingActionButton: Consumer<TodoProvider>(
        builder: (context, todo, child) {
          return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                context: context,
                builder: ((context) => TodoAddScreen(
                      callback: (Todo newTodo) {
                        todo.add(newTodo);
                      },
                    )),
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: Consumer<TodoProvider>(builder: (context, todo, child) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'Do zrobienia',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              if (todo.isLoading)
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final task = todo.todosNotComplete[index];

                    return Dismissible(
                      key: Key(task.todoId),
                      onDismissed: (direction) {
                        todo.remove(task);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Usunięto ${task.title}'),
                          ),
                        );
                      },
                      background: Container(color: Colors.red),
                      child: TodoSliver(
                        todo: task,
                        callback: (Todo newTodo) {
                          todo.update(newTodo);
                        },
                      ),
                    );
                  },
                  childCount: todo.todosNotComplete.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'Zrobione',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final task = todo.todosComplete[index];

                    return Dismissible(
                      key: Key(task.todoId),
                      onDismissed: (direction) {
                        todo.remove(task);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Usunięto ${task.title}'),
                          ),
                        );
                      },
                      background: Container(color: Colors.red),
                      child: TodoSliver(
                        todo: task,
                        callback: (Todo newTodo) {
                          todo.update(newTodo);
                        },
                      ),
                    );
                  },
                  childCount: todo.todosComplete.length,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
