import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  static final pageName = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
        
  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading : Icon( Icons.title, color: Colors.black),
            title   : Text('Card 1'),
            subtitle: Text('t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. '),
            trailing: Icon( Icons.arrow_right, color: Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Eliminar'),
                textColor: Colors.blue,
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Editar'),
                textColor: Colors.blue,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2() {
    final card =  Container(
                    child: Column(
                      children: <Widget>[
                        FadeInImage(
                          image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          fadeInDuration: Duration( milliseconds: 200),
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('kasjdfhkasjfhksajdf')
                        ),
                      ],
                    ),
                  );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
        // color: Colors.red
      ),
      child: ClipRRect(
        child : card,
        borderRadius: BorderRadius.circular(30.0),
      )
    );
  }
}