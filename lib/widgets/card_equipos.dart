// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:liga_corner_app/pages/detalle_Equipo.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:liga_corner_app/widgets/config_Responsive.dart';

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
                    // ignore: unnecessary_null_comparison
                    child: UrlImage == null
                        ? Image.asset('images/default_image_team.png')
                        : Image.network(
                            'https://ligasabatinadefutbol.com.mx/media/bearleague/${UrlImage}',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('images/default_image_team.png');
                            },
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
                        child: city != null ? Text(city) : const Text("Texto por defecto"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical(4),
              color: Color(0xFF4ECF84),
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
