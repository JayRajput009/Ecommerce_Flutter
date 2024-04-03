import 'package:flutter/material.dart';
import 'package:shopify/Screens/homescreen.dart';

class BottomNavigationWideget extends StatefulWidget {
  const BottomNavigationWideget({super.key});

  @override
  State<BottomNavigationWideget> createState() => _BottomNavigationWidegetState();
}

class _BottomNavigationWidegetState extends State<BottomNavigationWideget> {

      int _selectedindex = 0;
  static final List _widgetoption = [
   const HomeScreen(),



  ];

  void _ontapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetoption[_selectedindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        currentIndex: _selectedindex,
        type: BottomNavigationBarType.fixed,
        onTap: _ontapped,
        selectedItemColor: const Color(0xff721D24),
        unselectedItemColor: const Color.fromARGB(255, 75, 75, 75),
        // r

        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home"),

        BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Category"),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopify_rounded,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}