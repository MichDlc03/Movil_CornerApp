// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/partidos_provider.dart';
import 'package:liga_corner_app/pages/detalle_partido_page.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:liga_corner_app/widgets/card_titile.dart';
import 'package:provider/provider.dart';

//import '../dtos/responses/requests/partidos_response_dto.dart';

class PartidosPage extends StatelessWidget {
  //final PartidosResponseDto? partidos;
  const PartidosPage({
    super.key, //required this.partidos
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ChangeNotifierProvider(
        create: (context) => PartidosProvider()..fetchUsers(),
        //operador de cascada
        child: Scaffold(
          backgroundColor: const Color(0XFFE8E8E8),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CardTitlePartidos(),
              ),
              Consumer<PartidosProvider>(
                builder: (context, PartidosProvider, child) => PartidosProvider
                        .isLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF4ECF84)),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: ListView.builder(
                              itemCount: PartidosProvider.partidos?.length,
                              itemBuilder: (context, index) {
                                final plays = PartidosProvider.partidos?[index];
                                // const SizedBox(
                                //   height: 10,
                                // );
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 70,
                                                      child: Image.network(
                                                          'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team1.tEmblem}'),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  // border: Border.all(color: Colors.black, width: 3 ),
                                                  // ),
                                                  width: 40,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      'VS',
                                                      style: SafeGoogleFont(
                                                          'Nunito',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 70,
                                                      child: Image.network(
                                                          'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team2.tEmblem}'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      '${plays?.team1.tName}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: SafeGoogleFont(
                                                          'Nunito',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const SizedBox(
                                              // decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.black, width: 3 ),
                                              // ),
                                              width: 40,
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      '${plays?.team2.tName}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: SafeGoogleFont(
                                                          'Nunito',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 41 * fem,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff4ecf84),
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
                                                        builder: (context) =>
                                                            DetetallesPartido(
                                                                partidos:
                                                                    plays)));
                                              },
                                              child: Text(
                                                'Detalles',
                                                style: SafeGoogleFont(
                                                  'Nunito',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w800,
                                                  height: 1.3625 * ffem / fem,
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
