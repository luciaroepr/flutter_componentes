import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/pages/home_page.dart';

class AlertPage extends StatelessWidget {
  
  static final pageName = 'alert';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor:  Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back ),
        onPressed: ( ) {
          Navigator.pop( context );
        },
      ),
    );
  }


  void _mostrarAlerta( BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, /* se cierra si pulsamos fuera del alert */
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min, /*se adapta al contenido interno*/
            children: <Widget>[
              Text('Este es el Contenido de la caja de la alerta'),
              FlutterLogo( size: 100.0 )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                 Navigator.of(context).pop();
              },
            ),
          ],
        );

      }

    );
  }
}