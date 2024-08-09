// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:my_app/AllowencPage.dart';
// import 'package:my_app/homepage.dart';
// import 'package:my_app/mintAndBurn.dart';


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   // List of screens to navigate between
//   final List<Widget> _screens = [
//     HomeScreen(),
//     CenterCardScreen(),
//     AllowancePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? CupertinoTabScaffold(
//             tabBar: CupertinoTabBar(
//               activeColor: Colors.blue,
//                inactiveColor: Colors.white,              
              
//               backgroundColor:  Color.fromARGB(255, 17, 3, 54),
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.search),
//                   label: 'Search',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.person),
//                   label: 'Profile',
//                 ),
//               ],
//               currentIndex: _selectedIndex,
//               onTap: _onItemTapped,
//             ),
//             tabBuilder: (context, index) {
//               return CupertinoTabView(
//                 builder: (context) {
//                   return _screens[index];
//                 },
//               );
//             },
//           )
//         : Scaffold(
           
//             body: _screens[_selectedIndex],
//             bottomNavigationBar: BottomNavigationBar(
//               backgroundColor:   Color.fromARGB(255, 28, 5, 92),
//               currentIndex: _selectedIndex,
//               unselectedItemColor: Colors.white,
//               onTap: _onItemTapped,
//               selectedItemColor: Colors.blue,
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.send_1),
//                   label: 'Mint & Burn',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.money),
//                   label: 'D Transfer',
//                 ),
//               ],
//             ),
//           );
//   }
// }
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_app/AllowencPage.dart'; // Fixed the typo
import 'package:my_app/homepage.dart';
import 'package:my_app/mintAndBurn.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of screens to navigate between
  final List<Widget> _screens = [
    HomeScreen(),
    CenterCardScreen(),
    AllowancePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              activeColor: Colors.blue,
              inactiveColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 17, 3, 54),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return _screens[index];
                },
              );
            },
          )
        : Scaffold(
            body: _screens[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 28, 5, 92),
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.white,
              onTap: _onItemTapped,
              selectedItemColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.send_1),
                  label: 'Mint & Burn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.money),
                  label: 'D Transfer',
                ),
              ],
            ),
          );
  }
}
