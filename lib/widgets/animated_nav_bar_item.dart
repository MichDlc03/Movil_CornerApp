import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:liga_corner_app/pages/ajustes_page.dart';
import 'package:liga_corner_app/pages/notificaciones.dart';
import 'package:liga_corner_app/widgets/tab_bar.dart';

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({super.key});

  @override
  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> {
  int _currentIndex = 0;
  final screens = [
    const MyTabBar(),
    const MyNotification(),
    const PagePerfil()
  ];

  final colors = [Colors.green, Colors.greenAccent, Colors.green.shade400];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 5),
        child: GNav(
            iconSize: 30,
            onTabChange: (index) => setState(() {_currentIndex = index;}),
            selectedIndex: _currentIndex,
            tabBackgroundColor:const Color.fromARGB(223, 19, 175, 27),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Menu',
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notificaciones',
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Ajustes',
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              )
            ]),
      ),
    );
  }
}
