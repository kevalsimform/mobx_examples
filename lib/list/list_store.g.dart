// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  Computed<List<Observable<Todo>>>? _$todosComputed;

  @override
  List<Observable<Todo>> get todos =>
      (_$todosComputed ??= Computed<List<Observable<Todo>>>(() => super.todos,
              name: '_ListStore.todos'))
          .value;

  late final _$typeAtom = Atom(name: '_ListStore.type', context: context);

  @override
  filterType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(filterType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  dynamic removeAt(Todo todo) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.removeAt');
    try {
      return super.removeAt(todo);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add(Todo todo) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.add');
    try {
      return super.add(todo);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update() {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.update');
    try {
      return super.update();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
todos: ${todos}
    ''';
  }
}
