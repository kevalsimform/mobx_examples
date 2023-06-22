import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_examples/todo/todo_store.dart';


class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {

  String? todoTitle;
  TodoStore todoStore = TodoStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo',),centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Observer(
                builder: (context) {

                  print('building a observer');
                  return Column(

                    children: [
                      RadioMenuButton(value: filterType.all, groupValue: todoStore.type, onChanged: (value) {
                        todoStore.type = filterType.all;
                      }, child: const Text('All')),
                      RadioMenuButton(value: filterType.pending, groupValue: todoStore.type, onChanged: (value) {
                        todoStore.type = filterType.pending;
                      }, child: const Text('Pending')),
                      RadioMenuButton(value: filterType.done, groupValue: todoStore.type, onChanged: (value) {
                        todoStore.type = filterType.done;
                      }, child: const Text('done')),


                      const SizedBox(height: 50,),

                      ...todoStore.todos.map((element) => Observer(
                        builder: (context) {
                          print('building a tile for ${element.title}');
                          return ListTile(
                            leading: Checkbox(value: element.isTicked, onChanged: (value) {
                              element.isTicked = !element.isTicked;
                            },
                            ),
                            trailing: IconButton(onPressed: () {
                              todoStore.removeAt(element);
                            }, icon: const Icon(Icons.delete)),
                            title: Text(element.title.toString()),
                          );
                        }
                      )).toList(),

                      const SizedBox(height: 50,),

                      ElevatedButton(onPressed: () {
                        todoStore.update();
                      }, child: Text('update items'))
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
        showDialog(context: context, builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value) {
                      todoTitle = value;
                    },
                  ),
                ),
                ElevatedButton(onPressed: () {
                  todoStore.add(Todo(todoTitle.toString()));
                  todoTitle = null;
                  Navigator.of(context).pop();
                }, child: const Text('Add')) ,

                ElevatedButton(onPressed: () {
                  todoTitle = null;
                  Navigator.of(context).pop();
                }, child: const Text('Go Back'))
              ],
            ),
          );
        },);
      },
      child: const Icon(Icons.add)),
    );
  }
}
