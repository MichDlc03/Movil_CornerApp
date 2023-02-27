import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/torneo_provider.dart';
import 'package:liga_corner_app/dtos/responses/requests/torneo_response_dto.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:liga_corner_app/widgets/card_torneos.dart';
import 'package:provider/provider.dart';

class VistasTorneo extends StatelessWidget {
  final TorneoResponseDto? torneo;
  const VistasTorneo({
    super.key,
    required this.torneo,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TorneoProvider()..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            '${torneo?.sName}',
            style: SafeGoogleFont('Nunito', color: Colors.white),
          )),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF4ECF84),
        ),
        backgroundColor: const Color(0xffE8E8E8),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Card(
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
                            'Equipos participantes en el torneo ',
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
            ),
            Consumer<TorneoProvider>(
              builder: (context, TorneoProvider, child) => TorneoProvider
                      .isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF4ECF84)),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: torneo?.teams.length,
                          itemBuilder: (context, index) {
                            final team = torneo?.teams[index];
                            final ciudad = team?.tCity ?? 'Sin ciudad';
                            final logo = team?.tEmblem ??
                                'https://cdn.pixabay.com/photo/2015/01/21/00/56/soccer-606235_960_720.jpg';
                            final name = team?.tName;

                            return CardTorneos(
                                UrlImage: logo,
                                name: '$name',
                                city: ciudad); // return GestureDetector(
                          },
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
