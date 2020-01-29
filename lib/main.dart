import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_componentes/src/routes/routes.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), //        
      ],
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // routes: <String, WidgetBuilder> {
      //   '/'     : ( BuildContext context )  =>  HomePage(),
      //   'alert' : ( BuildContext context )  =>  AlertPage(),
      //   'avatar' : ( BuildContext context ) => AvatarPage(),
      // },
      onGenerateRoute: ( RouteSettings settings ) {
        // print('Ruta llamda: ${ settings.name }');
        // en caso de que route a nevegar no este definida, entra por aqui
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );

      },
    );
  }
}