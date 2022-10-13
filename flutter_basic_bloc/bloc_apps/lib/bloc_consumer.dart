import 'package:bloc_apps/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerScreen extends StatelessWidget {
  BlocConsumerScreen({Key? key}) : super(key: key);

  Counter myCounter = Counter(init: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('04 Bloc Consumer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 50),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Bilangan Ganjil'),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current % 2 == 1) {
                return true;
              } else {
                return false;
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
