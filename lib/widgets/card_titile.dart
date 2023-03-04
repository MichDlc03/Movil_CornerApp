import 'package:flutter/material.dart';
import 'package:liga_corner_app/utils.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class CardTitleResumen extends StatelessWidget {
  const CardTitleResumen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}


class CardTitlePartidos extends StatelessWidget {
  const CardTitlePartidos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  'Proximos encuentros',
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
    );
  }
}

