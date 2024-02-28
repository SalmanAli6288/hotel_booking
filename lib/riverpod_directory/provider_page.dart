import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/main.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(ref.read(nameProvider).toString())),
        ],
      ),

    );
  }
}
