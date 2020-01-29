import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
 
  static final pageName = 'list';

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() { 
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print('Final del scroll') ;
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack( /*apila elementos unos encimas de otros*/
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (  BuildContext context, int pos ) {

          final imagen = _listaNumeros[pos];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?random=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            fit: BoxFit.cover,
          );
        },
      ),
    );
    
  }


  Future<Null> obtenerPagina1() async{
    final duration = new Duration( seconds: 2 );
    new Timer( duration , () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

     setState(() {});

  }

  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250)
    );
    _agregar10();
  }

  // se dispara cuando se destruye la pagina
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading(){
    if ( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox( height: 15.0),
        ],
      );      
    } else {
      return Container();
    }
  }
}