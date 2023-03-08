// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/responses/requests/partidos_response_dto.dart';
import 'package:liga_corner_app/pages/resumen_resultados_pages.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:liga_corner_app/widgets/config_Responsive.dart';

class CardResultados extends StatelessWidget {
  const CardResultados({
    super.key,
    required this.plays,
    required this.fem,
    required this.ffem,
  });

  final PartidosResponseDto? plays;
  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Icon(Icons.sports_soccer),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal(45),
                              child: const Expanded(child: Text('Equipo',style:  TextStyle(fontSize: 20)))),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Goles',style:  TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
  width: 50,
  height: 50,
  child: FittedBox(
    fit: BoxFit.cover,
    child: plays?.team1.tEmblem == null
        ? Image.asset('images/default_image_team.png')
        : Image.network(
            'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team1.tEmblem}',
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Image.asset('images/default_image_team.png');
            },
          ),
  ),
),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.5),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal(50),
                          height: 30,
                          child: Text('${plays?.team1.tName}', style: const TextStyle(fontSize: 20),),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text('${plays?.score1}',style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Container(
  width: 50,
  height: 50,
  child: FittedBox(
    fit: BoxFit.cover,
    child: plays?.team1.tEmblem == null
        ? Image.asset('images/default_image_team.png')
        : Image.network(
            'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team2.tEmblem}',
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Image.asset('images/default_image_team.png');
            },
          ),
  ),
),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.5),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal(50),
                          height: 30,
                          child: Text('${plays?.team2.tName}',style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                        child: Container(
                          width: 25,
                          height: 30,
                          child: Center(
                            child: Text('${plays?.score2}',style: const TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              )),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.blockSizeHorizontal(12),
            decoration: const BoxDecoration(
              color: Color(0xFF4ECF84),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResumenResultados(
                                partidos: plays,
                              )));
                },
                child: Text(
                  'Detalles',
                  style: SafeGoogleFont(
                    'Nunito',
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.3625 * ffem / fem,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
