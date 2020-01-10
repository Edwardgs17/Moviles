import 'package:flutter/material.dart';

import 'package:Inversiones/src/bloc/provider.dart';

import 'package:Inversiones/src/pages/Projects/home_page.dart';
import 'package:Inversiones/src/pages/Users/login_page.dart';
import 'package:Inversiones/src/pages/Projects/project_home.dart';

 
void main() async {

 // final prefes = PreferencesUsers();
  //await prefes.initPrefs();

  runApp(MyApp());

 }
 
class MyApp extends StatelessWidget {
    //final prefes = PreferencesUsers();
  @override
  Widget build(BuildContext context) {

        //final prefes = PreferencesUsers();

   // print(prefes.token);
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Colfunding',
        initialRoute: 'login',
        routes: {
          'login'    : ( BuildContext context ) => LoginPage(),
          'home'     : ( BuildContext context ) => HomePage(),
          'project'  : ( BuildContext context ) => ProjectPage(),
          //'register' : ( BuildContext context ) => RegisterPage(),
  },
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
      ),
    );
      
  }
}