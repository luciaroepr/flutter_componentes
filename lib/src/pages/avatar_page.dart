import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  static final pageName = 'avatar';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i0.pngocean.com/files/985/915/772/superman-computer-icons-superhero-avatar.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,              
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/11/28/15433959641322.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back ),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
  }
}