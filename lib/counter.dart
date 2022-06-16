import 'dart:async';

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final StreamController _inputController = StreamController();
  StreamSink get input => _inputController.sink;

  final StreamController _outputController = StreamController();
  StreamSink get _output => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == 'add') {
        _counter++;
      } else if (event == 'reset') {
        _counter = 0;
      } else {
        _counter--;
      }
      _output.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
