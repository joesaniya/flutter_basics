import 'package:flutter/material.dart';
import 'package:basic_1/listview_builder_widget.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    ListviewBuilderWidget(),
    Center(child: Text('Settings Page')),
    Center(child: Text('Profile Page')),
  ];

  
  final List<Color> activeColors = [
    Colors.deepPurple,
    Colors.teal,
    Colors.orange,
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageSwitcher'),
        backgroundColor: activeColors[_currentIndex],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changeTab,
        selectedItemColor: activeColors[_currentIndex],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}


/*import 'package:basic_1/listview_builder_widget.dart';
import 'package:flutter/material.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _currentIndex = 0;
  List<Widget> pages = [
    ListviewBuilderWidget(),
    Center(child: Text('Settings Page')),
    Center(child: Text('Profile Page')),
  ];
  void changeTab(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageSwitcher')),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeTab(value);
        },
        selectedItemColor: _currentIndex == 0 ? Colors.deepPurple : Colors.grey,
        unselectedItemColor: _currentIndex == 0
            ? Colors.grey
            : Colors.deepPurpleAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
*/