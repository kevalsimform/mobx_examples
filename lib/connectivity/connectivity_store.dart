import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

// ignore: library_private_types_in_public_api
class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {

  @observable
  ObservableStream observableStream = ObservableStream(Connectivity().onConnectivityChanged);

  void dispose() {
    observableStream.close();
  }

}