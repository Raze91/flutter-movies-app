import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/home.dart';
import 'package:flutter_movies_app/components/profile.dart';
import 'package:flutter_movies_app/components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<Widget> list = [const Home(), const SearchPage(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter Movies App")),
        body: list[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          iconSize: 48,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
          ],
        ));
  }
}
