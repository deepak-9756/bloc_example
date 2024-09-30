import 'package:bloc_example/counter/bloc/counterbloc_bloc.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterblocBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterbloc = context.read<CounterblocBloc>();
    debugPrint("adddddd1");

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterblocBloc, CounterblocState>(
          builder: (context, state) {
            debugPrint("adddddd");
            return Text(state.counter.toString());
          },
        ),
        TextButton(
            onPressed: () {
              counterbloc.add(IncrementCounter());
            },
            child: const Icon(Icons.add)),
        TextButton(
            onPressed: () {
              counterbloc.add(DecrementCounter());
            },
            child: const Icon(Icons.minimize_outlined))
      ],
    ));
  }
}
