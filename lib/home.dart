import 'package:flutter/material.dart';
import 'package:td_2/card1.dart';
import 'package:td_2/card2.dart';
import 'package:td_2/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    Card1(),
    Card2(),
    Card3(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application TD2',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Page2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Page3',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}