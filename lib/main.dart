import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_project/bloc/gym_bloc/gym_data_bloc.dart';
import 'package:firebase_login_project/view/home/home_screen.dart';
import 'package:firebase_login_project/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_bloc/category_bloc.dart';
import 'bloc/gym_list_by_category_bloc/gym_list_by_category_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyB45zZwn3MOqoiC-T7zWuiRXenzKhyLLc8',
      appId: '1:463114614667:android:2d7d70473567024770e18e',
      messagingSenderId: '463114614667',
      projectId: 'fir-login-c0c83',
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GymDataBloc>(create: (context) => GymDataBloc()),
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
        BlocProvider<GymListByCategoryBloc>(
            create: (context) => GymListByCategoryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        themeMode: ThemeMode.dark, // Force dark theme
        home: LoginScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
