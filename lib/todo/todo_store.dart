import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

enum filterType {all,done,pending}

class Todo = _Todo with _$Todo;

abstract class _Todo with Store {

  @observable
  bool isTicked = false;

  @observable
  String title;

  toggleTick() {
    isTicked = !isTicked;
  }

  changeTitle(){
    title = 'changed title';
  }

  _Todo(this.title);

}


class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {

  @observable
  filterType type = filterType.all;

  @observable
  ObservableList<Todo> _todos = ObservableList.of([]);

  @action
  removeAt(Todo todo) {
    _todos.remove(todo);
  }

  @action
  add(Todo todo) {
    _todos.add(todo);
  }

  @action update(){
    for (var element in _todos) {element.title = '${element.title}#';}
  }

  @computed
  List<Todo> get todos => type == filterType.done ? _todos.where((element) => element.isTicked == true).toList() :
  type == filterType.pending ? _todos.where((element) => element.isTicked == false).toList() : _todos;

}
