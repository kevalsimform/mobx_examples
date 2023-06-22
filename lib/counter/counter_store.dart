import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {

  @observable
  int count = 0;

  Observable<int> count2 = Observable(0);

  late Action actionIncrement = Action(() {
    count++;
  });

  increment() {
    count++;
  }


  @computed
  int get sum => count + count2.value;

  @action
  void decrement(){
    count2.value--;
    print(count2);
  }

}
