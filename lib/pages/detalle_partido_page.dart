import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/partidos_provider.dart';
import 'package:liga_corner_app/dtos/responses/requests/partidos_response_dto.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:provider/provider.dart';

class DetedallesPartido extends StatelessWidget {
  final PartidosResponseDto? partidos;

  const DetedallesPartido({super.key, required this.partidos});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PartidosProvider()..fetchUsers(),
        child: Scaffold(
            backgroundColor: const Color(0xffe8e8e8),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: const Color(0xFF4ECF84),
              title: Center(
                child: Text('Detalles de partido',
                    style: SafeGoogleFont('Nunito',
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Consumer<PartidosProvider>(
                  builder: (context, PartidosProvider, child) =>
                      PartidosProvider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Color(0xFF4ECF84),
                            ))
                          : Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Card(
                                    //color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    elevation: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                margin: const EdgeInsets.all(5),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                color: Color(0xFF4ECF84),
                                                child: Center(
                                                  child: Text(
                                                    '${partidos?.team1.tName}   vs   ${partidos?.team2.tName} ',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                        'Nunito',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 100),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          height: 150,
                                                          color: const Color(
                                                              0xffe8e8e8e8),
                                                          child: Image.network(
                                                              'https://ligasabatinadefutbol.com.mx/media/bearleague/${partidos?.team1.tEmblem}'),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),

                                                        // const SizedBox(height: 2,),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 2),
                                                Container(
                                                  child: Text(
                                                    'VS',
                                                    style: SafeGoogleFont(
                                                        'Nunito',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 150,
                                                      height: 150,
                                                      color: const Color(
                                                          0xffe8e8e8e8),
                                                      child: Image.network(
                                                          'https://ligasabatinadefutbol.com.mx/media/bearleague/${partidos?.team2.tEmblem}'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              width: 350,
                                              height: 350,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Fecha: ',
                                                        style: SafeGoogleFont(
                                                            'Nunito',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text('${partidos?.mDate}',
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              fontSize: 16)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Hora: ',
                                                        style: SafeGoogleFont(
                                                            'Nunito',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text('${partidos?.mTime}',
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              fontSize: 16)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Lugar: ',
                                                        style: SafeGoogleFont(
                                                            'Nunito',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          '${partidos?.mLocation}',
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              fontSize: 16)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))))
            ])));
  }
}
