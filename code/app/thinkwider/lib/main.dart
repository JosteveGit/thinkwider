import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thinkwider!")),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse('http://localhost/hello')),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data?.body ?? 'Error');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
