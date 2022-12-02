import 'package:flutter_bloc_demo/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider.of(context)
          // BlocProvider(create: (context) => context.read())
          BlocProvider(create: (context) => CounterBloc()..add(LoadCounter()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var counterBlocRef = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: ((context, state) {
            if (state is CounterInitial) {
              return const CircularProgressIndicator(
                color: Colors.indigo,
              );
            }

            if (state is CounterLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${state.count}',
                    style: const TextStyle(fontSize: 36),
                  ),
                ],
              );
            } else {
              return const Text("Somthing went wrong");
            }
          }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              int c = counterBlocRef.state.count;
              counterBlocRef.add(CounterIncrement(c));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              int c = counterBlocRef.state.count;
              counterBlocRef.add(CounterDecrement(c));
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ), // Thi
    );
  }
}
