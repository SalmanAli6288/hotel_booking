import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class stateProviderPage extends ConsumerWidget {
  const stateProviderPage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        ref.watch(countProvider.notifier).update((state) => state++);
      },
      child: Icon(Icons.add),
    ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final b=ref.watch(countProvider);
          return Center(
            child: Text(b.toString()),
          );
        },
      ),
    );
  }
}
