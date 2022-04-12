import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/darktheme/dark_theme_provider.dart';
import 'package:flutter_movies_app/components/darktheme/dark_theme_style.dart';
import 'package:flutter_movies_app/routes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  final _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return FutureBuilder(
              future: _initialization,
              builder: ((context, snapshot) {
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
                    theme: Styles.themeData(
                        themeChangeProvider.darkTheme, context),
                    debugShowCheckedModeBanner: false,
                    routes: routes,
                    initialRoute: FirebaseAuth.instance.currentUser != null
                        ? '/'
                        : '/register',
                  );
                }

                return Container();
              }));
        },
      ),
    );
  }
}
