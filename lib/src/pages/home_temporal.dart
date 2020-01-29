import 'package:flutter/material.dart';

class HomePageTamporal extends StatelessWidget {

  final opciones = ['Uno', 'Dos','Tres','Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItmesCorta()
      ),
    );
  }

  List<Widget> _crearItems() {
    
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {

      final WidgetTemporal = ListTile(
        title: Text(opt),
      );

      lista..add( WidgetTemporal )
           ..add( Divider() );
    }

    return lista;
  }

  List<Widget> _crearItmesCorta() {

    return opciones.map( ( item ) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item + '!' ),
            leading: Icon( Icons.access_alarm ),
            trailing: Icon( Icons.arrow_right ),
            onTap: () {},
          ),
          Divider(),
        ],
      );

    }).toList();

  }

  
}