import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';

part 'random_stream_store.g.dart';

// ignore: library_private_types_in_public_api
class RandomStore = _RandomStore with _$RandomStore;

abstract class _RandomStore with Store {

  _RandomStore() {
    _streamController = StreamController<int>();

    _timer = Timer.periodic(const Duration(seconds: 1),
            (_) => _streamController.add(_random.nextInt(100)));

    randomStream = ObservableStream(_streamController.stream);
  }

  late final Timer _timer;

  final _random = Random();

  late final StreamController<int> _streamController;

  late final ObservableStream<int?> randomStream;

  // ignore: avoid_void_async
  void dispose() async {
    _timer.cancel();
    await _streamController.close();
  }
}