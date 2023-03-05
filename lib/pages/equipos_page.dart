import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/equipos_provider.dart';
import 'package:liga_corner_app/pages/players_team.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class TeamsPages extends StatelessWidget {
  const TeamsPages({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ChangeNotifierProvider(
        create: (context) => EquiposProvider()..fetchUsers(),
        //operador de cascada
        child: Scaffold(
            backgroundColor: const Color(0XFFE8E8E8),
            body:
                Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Consumer<EquiposProvider>(
                  builder: (context, equiposProvider, child) => equiposProvider
                          .isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF4ECF84),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: equiposProvider.equipos?.length,
                              itemBuilder: (BuildContext context, int index) {
                                final equipos = equiposProvider.equipos?[index];
                                return Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.all(10),
                                  color: const Color.fromARGB(223, 19, 175, 27),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    splashColor:
                                        const Color.fromARGB(255, 148, 225, 148),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayersTeamPage(
                                                      equipo: equipos)));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${equipos?.tName}',
                                                style: SafeGoogleFont('Nunito',
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Stack(
                                                children: [
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              color: Color(
                                                                  0xFF4ECF84))),
                                                  Center(
                                                      child: FadeInImage.memoryNetwork(
                                                          placeholder:
                                                              kTransparentImage,
                                                          image:
                                                              'https://ligasabatinadefutbol.com.mx/media/bearleague/${equipos?.tEmblem}'))
                                                ],
                                              ) // ),
                                              ),
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                              )
                            ]),
                )));
  }
}
