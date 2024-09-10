import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/home.dart';

import 'todo_bloc/todo_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Colors.white,
          onSurface: Colors.black,
          primary: Colors.lightBlue,  
          onPrimary: Colors.black,
          secondary: Colors.grey,
          onSecondary: Colors.black,
        )
      ),
      home: BlocProvider<TodoBloc>(
        create: (context) => TodoBloc()..add(
          TodoStarted()
        ),
        child: const HomeScreen(),
      )
    );
  }
}
