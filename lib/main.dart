import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization, builder: ((context, snapshot) {
      if (snapshot.hasError) {
        return const MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('Error'),
              ),
            ),
          ),
        );
      }

      if (snapshot.connectionState == ConnectionState.done) {
        return MaterialApp(
          title: 'Flutter',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          debugShowCheckedModeBanner: false,
          routes: routes,
          initialRoute:
          FirebaseAuth.instance.currentUser != null ? '/' : '/register',
        );
      }

      return Container();
    }));
  }
}
