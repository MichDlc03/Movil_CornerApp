import 'package:flutter/material.dart';
import 'package:liga_corner_app/core/info_notificaciones.dart';
import 'package:liga_corner_app/utils.dart';

class MyNotification extends StatefulWidget {
 const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  final List<InfoNotificaciones> _Info = [
    InfoNotificaciones(
        name: "Gran Torneo",
        description: "No te pierdas de esta nuevo Torneo:))"),
    InfoNotificaciones(
        name: "Jornada 2",
        description: "No te pierdas de esta nueva jornada :))"),
    InfoNotificaciones(
        name: "Liga Sabantina",
        description: "Que esperas para participar con nosotros"),
    InfoNotificaciones(
        name: "Estadio Merida",
        description: "Tenemos horarios para los nuevos partidos"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Center(
          child: Text(
            'Notificaciones',
            style: TextStyle(
              color: Color(0xFF595959),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: _Info.length,
        itemBuilder: ((context, index) {
          return ListTile(
            selectedColor: Colors.white,
            onLongPress: () {
              this._borrapersona(context, _Info[index]);
            },
            // builder: (BuildContext context) => AlertDialog(
            //   elevation: 10,
            //   title: const Text(' Eliminar Notificacion'),
            //   content: const Text('¿Deseas Eliminar esta notificacion?',
            //       style: TextStyle(color: Color(0xFF595959))),
            //   actions: <Widget>[
            //     TextButton(
            //       onPressed: () => Navigator.pop(context, 'Cancel'),
            //       child: const Text('Cancel',
            //           style: TextStyle(color: Color(0xFF4ECF84))),
            //     ),
            //     TextButton(
            //       onPressed: () => Navigator.pop(context, 'Delete'),
            //       child: const Text(
            //         'Eliminar',
            //         style: TextStyle(color: Color(0xFF4ECF84)),
            //       ),
            //     ),
            //   ],
            // ),

            title: Text(_Info[index].name),
            subtitle: Text(_Info[index].description,
                style: const TextStyle(color: Color(0xFF595959))),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF4ECF84),
              child: Text(
                _Info[index].name.substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }

  _borrapersona(context, InfoNotificaciones) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar Contacto'),
        content: const Text('¿Deseas eliminar la notiicacion?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _Info.remove(InfoNotificaciones);
              });

              Navigator.pop(context);
            },
            child: Text(
              'Eliminar',
              style: SafeGoogleFont('Nunito', color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
