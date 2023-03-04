// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:liga_corner_app/pages/perfil.dart';
import 'package:liga_corner_app/utils.dart';

class CardEquipos extends StatelessWidget {
  final String UrlImage;
  final String name;
  final String city;
  //final String numberplayers;
  const CardEquipos({
    Key? key,
    required this.UrlImage,
    required this.name,
    required this.city,
    // required this.numberplayers}
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 500;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      color: const Color(0xFFFFFFFF),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        // splashColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Expanded(
                    child: Image.network(
                      'https://ligasabatinadefutbol.com.mx/media/bearleague/${UrlImage}',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Nombre: ',
                        style: SafeGoogleFont(
                          'Nunito',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      child: Expanded(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: SafeGoogleFont('Nunito',
                              color: const Color(0XFf595959)),
                          // style: const TextStyle(
                          //   color: Colors.black,
                          //),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Ciudad: ',
                        style: SafeGoogleFont(
                          'Nunito',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      child: Expanded(
                        child: Text(
                          city,
                          overflow: TextOverflow.ellipsis,
                          style: SafeGoogleFont('Nunito',
                              color: const Color(0xff595959)),
                          // style: const TextStyle(
                          //   color: Colors.black,
                          //),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
              color: const Color(0xFF4ECF84),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayersPage()));
                },
                child: Center(
                    child: Text(
                  'Detalles',
                  style: SafeGoogleFont('Nunito',
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
