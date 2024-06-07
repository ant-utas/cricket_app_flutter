class CircularQueue {
  List<int> _array;
  int _front;
  int _rear;
  int _capacity;

  CircularQueue(int capacity) {
    _array = List<int>(capacity);
    _front = -1;
    _rear = -1;
    _capacity = capacity;
  }

  bool isEmpty() {
    return _front == -1;
  }

  bool isFull() {
    return (_rear + 1) % _capacity == _front;
  }

  void enqueue(int item) {
    if (isFull()) {
      print("Queue is full");
      return;
    }
    if (isEmpty()) {
      _front = 0;
    }
    _rear = (_rear + 1) % _capacity;
    _array[_rear] = item;
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue is empty");
      return null;
    }
    int item = _array[_front];
    if (_front == _rear) {
      _front = -1;
      _rear = -1;
    } else {
      _front = (_front + 1) % _capacity;
    }
    return item;
  }

  void display() {
    if (isEmpty()) {
      print("Queue is empty");
      return;
    }
    int i = _front;
    while (i != _rear) {
      print(_array[i]);
      i = (i + 1) % _capacity;
    }
    print(_array[_rear]);
  }
}
/*
void main() {
  CircularQueue queue = CircularQueue(5);
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  queue.enqueue(5);
  queue.enqueue(6); // Should print "Queue is full"
  queue.display(); // Should print 1 2 3 4 5
  queue.dequeue();
  queue.dequeue();
  queue.display(); // Should print 3 4 5
}*/
