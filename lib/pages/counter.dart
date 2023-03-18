import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_example/stores/counter/counter.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  final CounterStore counter = GetIt.I.get<CounterStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MobX Example'),
          centerTitle: true,
        ),
        body: Center(
          child:
              Observer(builder: (_) => Text(counter.counterValue.toString())),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => counter.incrementCounter(),
              child: const Icon(Icons.plus_one),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => counter.decrementCounter(),
              child: const Icon(Icons.exposure_minus_1),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => counter.resetCounter(),
              child: const Icon(Icons.restore),
            ),
          ],
        ));
  }
}
