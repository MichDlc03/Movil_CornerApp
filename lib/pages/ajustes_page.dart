import 'package:flutter/material.dart';
import 'package:liga_corner_app/widgets/config_Responsive.dart';

class PagePerfil extends StatefulWidget {
  const PagePerfil({super.key});

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    String _title = 'Ajustes';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4ECF84),
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          _title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CardNotify(),
              CardLenguaje(),
              Cardhelp(),
              InfoApp(),
              CardLogOut()
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfoProfile extends StatelessWidget {
  const CardInfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);

    return Container(
      decoration: const BoxDecoration(color: Color(0xFFE8E8E8)),
      margin: const EdgeInsets.all(5),
      width: SizeConfig.screenWidth,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.person, color: Color(0xFF4ECF84)),
            ),
            const Expanded(
              child: Text(
                'Mi Informacion',
                textAlign: TextAlign.justify,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.pushNamed(context, '/settinsProfile');
              },
            )
          ],
        ),
      ),
    );
  }
}

class CardProfileImage extends StatelessWidget {
  const CardProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(18 * fem, 0 * fem, 19 * fem, 23 * fem),
      padding: EdgeInsets.fromLTRB(11 * fem, 17 * fem, 12 * fem, 33 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10 * fem),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            offset: Offset(0 * fem, 2 * fem),
            blurRadius: 0 * fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Container(
                width: fem * 70,
                height: fem * 70,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/user.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Leonel Messi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardNotify extends StatelessWidget {
  const CardNotify({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return Container(
      margin: const EdgeInsets.all(5),
      width: SizeConfig.screenWidth,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.notifications, color: Color(0xFF4ECF84)),
            ),
            Expanded(
              child: Text(
                'Notificación',
                textAlign: TextAlign.justify,
              ),
            ),
            SwitchOnOff(),
          ],
        ),
      ),
    );
  }
}

class SwitchOnOff extends StatefulWidget {
  const SwitchOnOff({super.key});

  @override
  State<SwitchOnOff> createState() => _SwitchOnOffState();
}

class _SwitchOnOffState extends State<SwitchOnOff> {
  bool light1 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}

class CardLenguaje extends StatelessWidget {
  const CardLenguaje({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return Container(
      margin: const EdgeInsets.all(5),
      width: SizeConfig.screenWidth,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.language, color: Color(0xFF4ECF84)),
            ),
            const Expanded(
              child: Text(
                'Idioma',
                textAlign: TextAlign.justify,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lenguaje_pages');
                },
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xE8E8E8E8)))
          ],
        ),
      ),
    );
  }
}

class Cardhelp extends StatelessWidget {
  const Cardhelp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return Container(
      margin: const EdgeInsets.all(5),
      width: SizeConfig.screenWidth,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.help_outline, color: Color(0xFF4ECF84)),
            ),
            Expanded(
              child: Text(
                'Ayuda',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.arrow_forward_ios, color: Color(0xFE8E8E8E)),
            )
          ],
        ),
      ),
    );
  }
}

class CardLogOut extends StatelessWidget {
  const CardLogOut({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return Container(
      margin: const EdgeInsets.all(5),
      width: SizeConfig.screenWidth,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.logout, color: Color(0xFF4ECF84)),
            ),
            Expanded(
              child: Text(
                'Cerrar Sesión',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoApp extends StatelessWidget {
  const InfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 70,
      child: const Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: AboutListTile(
            icon: Icon(
              Icons.info_outline,
              color: Color(0xFF4ECF84),
            ),
            applicationIcon: FlutterLogo(),
            applicationLegalese: 'Legalese',
            applicationName: 'Corner',
            applicationVersion: '1.0.0',
            aboutBoxChildren: [Text('Aplicacion creadada en flutter')],
          )),
    );
  }
}
