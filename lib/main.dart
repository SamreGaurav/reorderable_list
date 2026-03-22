import 'package:flutter/material.dart';
import 'package:reorder_list_example/core/di/dependency_injection.dart';

import 'feature/watch_list/presentation/view/watch_list_view.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reorder List Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WatchlistView(),
    );
  }
}
