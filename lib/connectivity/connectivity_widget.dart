import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_examples/connectivity/connectivity_store.dart';

class ConnectivityWidget extends StatelessWidget {
  ConnectivityWidget({super.key});

  final ConnectivityStore connectivityStore = ConnectivityStore();

  @override
  Widget build(BuildContext context) {
    print('main build running');
    return ReactionBuilder(
      builder: (context) {
        print('running reaction builder');
        return reaction((_) => connectivityStore.observableStream.value, (result) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Connectivity'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child:  Observer(
              builder: (context) {
                return Text('${connectivityStore.observableStream.value.toString()}');
              }
            ),
          ),
        ),
      ),
    );
  }
}
