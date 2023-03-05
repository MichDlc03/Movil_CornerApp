import 'package:flutter/material.dart';
import 'package:liga_corner_app/pages/equipos_page.dart';
import 'package:liga_corner_app/pages/resultados_page.dart';
import 'package:liga_corner_app/pages/torneos_pages.dart';

import '../pages/partidos_page.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  void despose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.50;
      return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'images/logo.png',
          height: 50,
          width: 120,
        ),
        backgroundColor:const Color.fromARGB(223, 19, 175, 27),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5), //
                        child: TabBar(
                          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Color.fromARGB(255, 82, 244, 101); //<-- SEE HERE
                                }
                            return null; 
                            },
                            ),
                          unselectedLabelColor: const Color(0xFF595959),
                          labelColor:const Color.fromARGB(255, 255, 255, 255),
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: const Color.fromARGB(223, 19, 175, 27),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Partidos',
                            ),
                            Tab(
                              text: 'Torneos',
                            ),
                            Tab(
                              text: 'Resultados',
                            ),
                            Tab(
                              text: 'Equipos',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: const [
                    PartidosPage(),
                    TorneosPages(),
                    ResultadosPage(),
                    TeamsPages()
                  ],
                )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
