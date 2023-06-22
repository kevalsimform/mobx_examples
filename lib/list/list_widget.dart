import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'list_store.dart';


class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  String? todoTitle;
  ListStore todoStore = ListStore();

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
                              print('building a tile for ${element.value.title}');
                              return ListTile(
                                leading: Checkbox(value: element.value.isTicked, onChanged: (value) {
                                  element.value.isTicked = !element.value.isTicked;
                                },
                                ),
                                trailing: IconButton(onPressed: () {
                                  todoStore.removeAt(element.value);
                                }, icon: const Icon(Icons.delete)),
                                title: Text(element.value.title.toString()),
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
