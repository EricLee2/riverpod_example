import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/riverpod/code_generation_provider.dart';

class CodeGeneratioinScreen extends ConsumerWidget {
  const CodeGeneratioinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

    return DefaultLayout(
        title: 'CodeGenerationScreen',
        body: Column(children: [
          Text('State1: $state1'),
          state2.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          state3.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          Text('State4: $state4'),
          Consumer(builder: (context, ref, child) {
            final state5 = ref.watch(gStateNotifierProvider);

            return Text('State4: $state5');
          }),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).increment();
                  },
                  child: Text('Increment')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).decrement();
                  },
                  child: Text('Decrement')),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: Text('Invalidate'))
        ]));
  }
}
