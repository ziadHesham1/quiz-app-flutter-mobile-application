import 'dart:collection';

class MyStack<T> {
  MyStack();
  Queue q = Queue<T>();
  void push(T t) {
    q.add(t);
  }

  T? pop() {
    final last = q.last;
    if (!last.empty()) {
      q.removeLast();
      return last;
    } else {
      return null;
    }
  }

  String getAllValues() {
    return q.toString();
  }

  void empty() {
    q.clear();
  }
}
