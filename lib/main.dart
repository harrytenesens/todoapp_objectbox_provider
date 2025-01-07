import 'package:flutter/material.dart';
import 'package:simpletodo/homepage.dart';
import 'package:provider/provider.dart';
import 'package:simpletodo/provider_section.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final todoProvider = TodoboxR(); 
  await todoProvider.initialize();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: todoProvider), //setting up provider routes
      ],
      child: const MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage());
  }
}
