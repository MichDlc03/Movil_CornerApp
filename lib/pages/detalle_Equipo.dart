import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/providers/players_provider.dart';
import 'package:liga_corner_app/utils.dart';
import 'package:provider/provider.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ChangeNotifierProvider(
      create: (context) => PlayersProvider()..fetchUser(),
      child: Scaffold(
        backgroundColor: const Color(0xFFE8E8E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF4ECF84),
          elevation: 0,
          title: Text(
            'Jugadores',
            style: SafeGoogleFont('Nunito', color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PlayersProvider>(
                builder: (context, PlayersProvider, child) => PlayersProvider
                        .isLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF4ECF84)),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: PlayersProvider.players?.length,
                          itemBuilder: (context, index) {
                            final player = PlayersProvider.players?[index];
                            final photo = player?.photos[index];
                            return Column(
                              children: [
                                ListTile(
                                  // trailing: Text('${player?.team.tName}'),
                                  leading: Image.network(
                                      'https://ligasabatinadefutbol.com.mx/media/bearleague/${photo?.phFilename}'),
                                  title: Text(
                                      '${player?.firstName} ${player?.lastName}'),
                                  subtitle: Text('${player?.position.pNa2me}'),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                      )
          ],
        ),
      ),
    );
  }
}

