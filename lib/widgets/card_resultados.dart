// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/responses/requests/partidos_response_dto.dart';
import 'package:liga_corner_app/pages/resumen_resultados_pages.dart';
import 'package:liga_corner_app/utils.dart';

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
     double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:const Color(0xfff9f9f9),
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team1.tEmblem}'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 150,
                        height: 30,
                        child: Text(
                            '${plays?.team1.tName}'),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                              '${plays?.score1}'),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team2.tEmblem}'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 150,
                        height: 30,
                        child: Text(
                            '${plays?.team2.tName}'),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                              '${plays?.score2}'),
                        ),
                      ),
                    ]),
                  ],
                ),
              )),
          Container(
            width: double.infinity,
            height: 30 * fem,
            decoration: const BoxDecoration(
              color: Color(0xff4ecf84),
              borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(10),
                bottomLeft:
                    Radius.circular(10),
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResumenResultados(
                                partidos:
                                    plays,
                              )));
                },
                child: Text(
                  'Detalles',
                  style: SafeGoogleFont(
                    'Nunito',
                    fontSize: 15 * ffem,
                    fontWeight:
                        FontWeight.w700,
                    height:
                        1.3625 * ffem / fem,
                    color: const Color(
                        0xFFFFFFFF),
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

