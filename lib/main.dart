import 'package:covid19_test/providers/ConfirmedCases.dart';
import 'package:covid19_test/screens/DetailScreen.dart';
import 'package:covid19_test/screens/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(
      create: (ctx) => ConfirmedCases(),
      child: MaterialApp(
        title: 'Covid19Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const LandingPage(),
        routes: {
          DetailScreen.routeName: (ctx) => DetailScreen(),
        },
      ),
    );
  }
}
