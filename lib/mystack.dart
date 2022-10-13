import 'dart:collection';

class MyStack<T> {
  MyStack();
  Queue q = Queue<T>();
  void push(T t) {
    q.add(t);
  }

  T? pop() {
    final last = q.last;
    q.removeLast();
    return last;
  }

  String getAllValues() {
    return q.toString();
  }

  void empty() {
    q.clear();
  }
}
