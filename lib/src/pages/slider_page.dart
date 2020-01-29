import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {


  static final pageName = 'slider';


  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool   _valorCheck  = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
             _crearSlider(),
             _crearCheckBox(),
             _crearSwitch(),
             Expanded(
               child: _crearImagen()
             ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back ),
        onPressed: ( ) {
          Navigator.pop( context );
        },
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_valorCheck) ? null :
        (valor) {
        setState(() {
          _valorSlider = valor;
         
        });       
      },
    );
  }


  Widget _crearImagen() {
    // return Image(
    //   image: NetworkImage('https://cdn.isfap.com/wp-content/uploads/2016/01/test-del-arbol-utilidad-y-significacion-psicologica.jpg'),
    //   width: _valorSlider,
    //   fit: BoxFit.contain,
    // );
  
    return FadeInImage(
      image: NetworkImage('https://i.servimg.com/u/f82/13/14/96/46/tm/26787110.gif'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration( milliseconds: 200),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  
  }

  _crearCheckBox() {
    // return Checkbox(
    //   value: _valorCheck,
    //   onChanged: ( valor ) {
    //     setState(() {
    //       _valorCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title : Text('Bloquear slider'),
      value: _valorCheck,
      onChanged: ( valor ) {
        setState(() {
          _valorCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title : Text('Bloquear slider'),
      value: _valorCheck,
      onChanged: ( valor ) {
        setState(() {
          _valorCheck = valor;
        });
      },
    );
  }
}