// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/partidos_provider.dart';
import 'package:liga_corner_app/pages/resumen_resultados_pages.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:provider/provider.dart';

//import '../dtos/responses/requests/partidos_response_dto.dart';

class ResultadosPage extends StatelessWidget {
  //final PartidosResponseDto? partidos;
  const ResultadosPage({
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
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ClipPath(
                  // ignore: sort_child_properties_last
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Color(0xff4ecf84), width: 10))),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            'Encuentros finalizados ',
                            style: SafeGoogleFont('Nunito',
                                color: const Color(0XFf595959),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Consumer<PartidosProvider>(
                  builder: (context, PartidosProvider, child) =>
                      PartidosProvider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                  color: Color(0xFF4ECF84)),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: PartidosProvider.partidos?.length,
                                  itemBuilder: (context, index) {
                                    final plays =
                                        PartidosProvider.partidos?[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Card(
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
                                                  color: Color(0xfff9f9f9),
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
                                                        Container(
                                                          width: 150,
                                                          height: 30,
                                                          child: Text(
                                                              '${plays?.team1.tName}'),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
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
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                          child: Image.network(
                                                              'https://ligasabatinadefutbol.com.mx/media/bearleague/${plays?.team2.tEmblem}'),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
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
                                      ),
                                    );
                                  })))
            ])));
  }
}
