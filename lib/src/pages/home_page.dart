import 'package:flutter/material.dart';

import 'package:flutter_componentes/src/providers/menu_provider.dart';
import 'package:flutter_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Componentes' ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

        print( snapshot.data );
        
        return ListView(
          children: _listaItems( snapshot.data, context ),
        );
      },
    );

  }

  List <Widget>_listaItems( List<dynamic> data, BuildContext context) {

    List <Widget> lista = []; 


    for (var opt in data) {

      final widgetTemporal = ListTile(
        title: Text (
          opt['texto']
        ),
        leading: getIcon( opt['icon']),
        trailing: Icon( Icons.arrow_right, color: Colors.blue ),
        onTap: () {

          // navegacion por nombre
          Navigator.pushNamed(context, opt['ruta']);

          // naveagacion con page concreta
          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );
          // Navigator.push(context, route);
        },
      );

      lista..add( widgetTemporal )
            ..add( Divider() );
    }

    return lista;

  }

}