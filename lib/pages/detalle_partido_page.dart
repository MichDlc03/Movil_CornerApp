import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/partidos_provider.dart';
import 'package:liga_corner_app/dtos/responses/requests/partidos_response_dto.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:liga_corner_app/widgets/config_Responsive.dart';
import 'package:provider/provider.dart';

class DetetallesPartido extends StatelessWidget {
  final PartidosResponseDto? partidos;

  const DetetallesPartido({super.key, required this.partidos});
  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ChangeNotifierProvider(
        create: (context) => PartidosProvider()..fetchUsers(),
        child: Scaffold(            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: const Color(0xFF4ECF84),
              title: Center(
                child: Text('Resumen de partido',
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  child: Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: SizeConfig.screenWidth,
                                          height: 70,
                                          child: Text(
                                            '${partidos?.team1.tName}  vs  ${partidos?.team2.tName}',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont('Nunito',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                                color: const Color(0xff595959)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: SizeConfig.screenWidth,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Card(
                                                  color: const Color(0xffffffff),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: SizedBox(
                                                      width: SizeConfig
                                                          .blockSizeHorizontal(28),
                                                      height: 100,
                                                      child: partidos?.team1
                                                                  .tEmblem ==
                                                              null
                                                          ? Image.asset(
                                                              'images/logoLigaTorneo.jpg')
                                                          : Image.network(
                                                              'https://ligasabatinadefutbol.com.mx/media/bearleague/${partidos?.team1.tEmblem}',
                                                              errorBuilder:
                                                                  (context, error,
                                                                      stackTrace) {
                                                                return Image.asset(
                                                                    'images/logoLigaTorneo.jpg');
                                                              },
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ),                                             
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: SizedBox(
                                                  width: SizeConfig.blockSizeHorizontal(10),
                                                  height: 100,
                                                  child: Center(
                                                    child: Text(
                                                      'VS',
                                                      textAlign: TextAlign.center,
                                                      style: SafeGoogleFont(
                                                          'Nunito',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                ),
                                              ),                                               
                                              Expanded(
                                                child: Card(
                                                  color: const Color(0xffffffff),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: SizedBox(
                                                      width: SizeConfig.blockSizeHorizontal(28),
                                                      height: 100,
                                                      child: partidos?.team2
                                                                  .tEmblem ==
                                                              null
                                                          ? Image.asset(
                                                              'images/logoLigaTorneo.jpg')
                                                          : Image.network(
                                                              'https://ligasabatinadefutbol.com.mx/media/bearleague/${partidos?.team2.tEmblem}',
                                                              errorBuilder:
                                                                  (context, error,
                                                                      stackTrace) {
                                                                return Image.asset(
                                                                    'images/logoLigaTorneo.jpg');
                                                              },
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Card(
                                              child: ClipPath(
                                                // ignore: sort_child_properties_last
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          left: BorderSide(
                                                              color: Color(
                                                                  0xff4ecf84),
                                                              width: 10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
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
                                                        Text(
                                                          '${partidos?.mDate} ',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              color: const Color(
                                                                  0XFf595959)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                clipper: ShapeBorderClipper(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Card(
                                              child: ClipPath(
                                                // ignore: sort_child_properties_last
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          left: BorderSide(
                                                              color: Color(
                                                                  0xff4ecf84),
                                                              width: 10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
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
                                                        Text(
                                                          '${partidos?.mTime} ',
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              color: const Color(
                                                                  0XFf595959)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                clipper: ShapeBorderClipper(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Card(
                                              child: ClipPath(
                                                // ignore: sort_child_properties_last
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          left: BorderSide(
                                                              color: Color(
                                                                  0xff4ecf84),
                                                              width: 10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
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
                                                          '${partidos?.mLocation} ',
                                                          style: SafeGoogleFont(
                                                              'Nunito',
                                                              color: const Color(
                                                                  0XFf595959)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                clipper: ShapeBorderClipper(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
            ])));
  }
}
