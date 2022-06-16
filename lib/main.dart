import 'package:bloc_state/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = CounterBloc();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Bloc'),
        ),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    bloc.input.add('add');
                  },
                  icon: const Icon(Icons.add)),
              StreamBuilder(
                initialData: bloc.counter,
                stream: bloc.output,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Counter is : ${snapshot.data}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              IconButton(
                  onPressed: () {
                    bloc.input.add('minus');
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => bloc.input.add('reset'),
        ),
      ),
    );
  }
}
