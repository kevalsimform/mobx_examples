// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on _ConnectivityStore, Store {
  late final _$observableStreamAtom =
      Atom(name: '_ConnectivityStore.observableStream', context: context);

  @override
  ObservableStream<dynamic> get observableStream {
    _$observableStreamAtom.reportRead();
    return super.observableStream;
  }

  @override
  set observableStream(ObservableStream<dynamic> value) {
    _$observableStreamAtom.reportWrite(value, super.observableStream, () {
      super.observableStream = value;
    });
  }

  @override
  String toString() {
    return '''
observableStream: ${observableStream}
    ''';
  }
}
