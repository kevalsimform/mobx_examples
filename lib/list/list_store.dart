
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

enum filterType {all,done,pending}

class ListStore = _ListStore with _$ListStore;

// abstract class _ListStore with Store {
//
//   @observable
//   filterType type = filterType.all;
//
//   // @observable
//   // ObservableList<Todo> _todos =  ObservableList.of([]);
//
//   // @observable
//   // List<Todo> _todos =  [];
//
//   @observable
//   List<Observable<Todo>> _todos =  [];
//
//   @action
//   removeAt(Todo todo) {
//     _todos.remove(todo);
//   }
//
//   @action
//   add(Todo todo) {
//   _todos.add(todo);
//
//   List<Todo> l = [];
//    l = List.from(_todos);
//
//    _todos = l;
//
//   }
//
//   @action update(){
//     for (var element in _todos) {element.title = '${element.title}#';}
//   }
//
//   @computed
//   List<Todo> get todos => type == filterType.done ? _todos.where((element) => element.isTicked == true).toList() :
//   type == filterType.pending ? _todos.where((element) => element.isTicked == false).toList() : _todos;
//
//   // @computed
//   // ObservableList<Todo> get todos => type == filterType.done ? ObservableList.of(_todos.where((element) => element.isTicked == true).toList())  :
//   // type == filterType.pending ?  ObservableList.of(_todos.where((element) => element.isTicked == false).toList()) : _todos;
//
// }

abstract class _ListStore with Store {

  @observable
  filterType type = filterType.all;

  // @observable
  // ObservableList<Todo> _todos =  ObservableList.of([]);

  // @observable
  // List<Todo> _todos =  [];

  // @observable
  // List<Observable<Todo>> _todos =  [];

  ObservableList<Observable<Todo>> _todos = ObservableList.of([]);

  @action
  removeAt(Todo todo) {
    _todos.remove(todo);
  }

  @action
  add(Todo todo) {
    _todos.add(Observable(todo));
  }

  @action update(){
    for (var element in _todos) {
      element.value.title = '${element.value.title}#';
      element.reportChanged();
    }
  }

  @computed
  List<Observable<Todo>> get todos => type == filterType.done ? _todos.where((element) => element.value.isTicked == true).toList() :
  type == filterType.pending ? _todos.where((element) => element.value.isTicked == false).toList() : _todos;

}



class Todo{

  bool isTicked = false;

  String title;

  toggleTick() {
    isTicked = !isTicked;
  }

  changeTitle(){
    title = 'changed title';
  }

  Todo(this.title);
}