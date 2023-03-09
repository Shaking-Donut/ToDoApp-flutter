import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/colors.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/views/home_view.dart';
import 'package:todo/views/login_view.dart';
import 'package:todo/views/register_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => TodoProvider()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'NatDrive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: 'Rubik',
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(16),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: TextStyle(
              color: AppColors.primary,
            ),
            hintStyle: TextStyle(
              color: AppColors.gray4,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.background3,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AppColors.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AppColors.error,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: null,
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.gray1,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
            ),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const RegisterView(),
          "/login": (context) => const LoginView(),
          "/home": (context) => const HomeView(),
        },
      ),
    );
  }
}
