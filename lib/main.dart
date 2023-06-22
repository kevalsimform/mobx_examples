import 'package:flutter/material.dart';
import 'package:mobx_examples/counter/counter_widget.dart';
import 'package:mobx_examples/todo/todo_widget.dart';

import 'connectivity/connectivity_store.dart';
import 'connectivity/connectivity_widget.dart';
import 'form/form_widget.dart';
import 'github/github_widget.dart';
import 'list/list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  GithubExample(),
    );
  }
}

