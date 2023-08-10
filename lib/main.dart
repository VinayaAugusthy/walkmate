import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/controllers/basescreen_provider.dart';
import 'package:walkmate/views/screens/base_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BaseScreenNotifier())
  ], child: const MyApp()));
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
      home: BaseScreen(),
    );
  }
}
