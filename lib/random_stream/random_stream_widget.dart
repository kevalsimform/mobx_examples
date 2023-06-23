import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_examples/random_stream/random_stream_store.dart';

class RandomNumberExample extends StatefulWidget {
  const RandomNumberExample({Key? key}) : super(key: key);

  @override
  State<RandomNumberExample> createState() => _RandomNumberExampleState();
}

class _RandomNumberExampleState extends State<RandomNumberExample> {

  final RandomStore store = RandomStore();

 Stream getStream(){
   return Stream.periodic(const Duration(seconds: 5),(computationCount) => computationCount,).take(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Random number',
              style: TextStyle(color: Colors.grey),
            ),
            // StreamBuilder(
            // stream: getStream(),
            //   builder: (context, snapshot) {
            //   print('${snapshot.connectionState} ${snapshot.data} ${snapshot.hasData}');
            //    return Text(snapshot.data.toString(),style: TextStyle(fontSize: 40),);
            //   },
            // ),
            Observer(
              builder: (_) {
                final value = store.randomStream.value;
                print('${store.randomStream.data}');
                return Text(
                  '${value ?? '---'}',
                  style: const TextStyle(fontSize: 96),
                );
              },
            ),
          ],
        ),
      ));
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
}