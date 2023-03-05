import 'package:flutter/material.dart';
import 'package:liga_corner_app/pages/ajustes_page.dart';
import 'package:liga_corner_app/pages/notificaciones.dart';
import 'package:liga_corner_app/widgets/tab_bar.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.50;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: NavigationBar(
          backgroundColor: Colors.white,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(223, 19, 175, 27),
              ),
              
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.notifications,
                color: Color.fromARGB(223, 19, 175, 27),
              ),
              label: 'Notificaciones',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings,
                color:Color.fromARGB(223, 19, 175, 27),
              ),
              label: 'Ajustes',
            ),
          ],
        ),
      ),
      body: <Widget>[
        Container(
          color: const Color(0xFFE8E8E8),
          alignment: Alignment.center,
          child: const MyTabBar(),
        ),
        Container(
          color: const Color(0xFFE8E8E8),
          alignment: Alignment.center,
          child: MyNotification(),
        ),
        Container(
          color: const Color(0xFFE8E8E8),
          alignment: Alignment.center,
          child:const PagePerfil(),
        ),
      ][currentPageIndex],
    );
  }
}
