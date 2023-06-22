

import 'package:flutter/material.dart';
import 'package:mobx_examples/counter/counter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Counter extends StatelessWidget {
  Counter({super.key});

  CounterStore counterStore = CounterStore();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Coutner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (BuildContext context) {
                print('running observer builder1 ${counterStore.count}');
                return Text(
                  'Count 1 : ${counterStore.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Observer(
              builder: (BuildContext context) {
                print('running observer builder2 ${counterStore.count2}');
                return Text(
                  'Count 2 : ${counterStore.count2.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Observer(builder: (context) {
             return Text(
                'Sum : ${counterStore.sum}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },)

          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // counterStore.actIncrement();
              counterStore.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              counterStore.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
