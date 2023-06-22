// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Todo on _Todo, Store {
  late final _$isTickedAtom = Atom(name: '_Todo.isTicked', context: context);

  @override
  bool get isTicked {
    _$isTickedAtom.reportRead();
    return super.isTicked;
  }

  @override
  set isTicked(bool value) {
    _$isTickedAtom.reportWrite(value, super.isTicked, () {
      super.isTicked = value;
    });
  }

  late final _$titleAtom = Atom(name: '_Todo.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  @override
  String toString() {
    return '''
isTicked: ${isTicked},
title: ${title}
    ''';
  }
}

mixin _$TodoStore on _TodoStore, Store {
  Computed<List<Todo>>? _$todosComputed;

  @override
  List<Todo> get todos => (_$todosComputed ??=
          Computed<List<Todo>>(() => super.todos, name: '_TodoStore.todos'))
      .value;

  late final _$typeAtom = Atom(name: '_TodoStore.type', context: context);

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

  late final _$_todosAtom = Atom(name: '_TodoStore._todos', context: context);

  @override
  ObservableList<Todo> get _todos {
    _$_todosAtom.reportRead();
    return super._todos;
  }

  @override
  set _todos(ObservableList<Todo> value) {
    _$_todosAtom.reportWrite(value, super._todos, () {
      super._todos = value;
    });
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  dynamic removeAt(Todo todo) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.removeAt');
    try {
      return super.removeAt(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add(Todo todo) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.add');
    try {
      return super.add(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update() {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.update');
    try {
      return super.update();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
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
