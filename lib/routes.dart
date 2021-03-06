import 'package:flutter/material.dart';
import 'package:flutter_movies_app/screens/auth/login.dart';
import 'package:flutter_movies_app/screens/auth/register.dart';
import 'package:flutter_movies_app/screens/homepage.dart';
import 'package:flutter_movies_app/screens/movie_details.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const LoginScreen(),
  '/': (context) => const HomePage(),
  '/details': (context) => const MovieDetails()
};
