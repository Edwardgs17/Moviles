//import 'package:Inversiones/src/providiers/users_providier.dart';
import 'package:flutter/material.dart';
import 'package:Inversiones/src/bloc/provider.dart';


import 'sideBar.dart';

class LoginPage extends StatelessWidget {

  //final usuarioProvidier=new UserProvidier();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('ColFunding'),
        centerTitle: true,
        
        ),

      drawer: SideBar(),

      body: Stack(
        children: <Widget>[
          _createBackground( context ),
          _loginForm( context ),
        ],
      )
    );
  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric( vertical: 50.0 ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0
                  )
                ]
              ),
              child: Column(
                children: <Widget>[
                  Text('Iniciar Sesión', style: TextStyle(fontSize: 20.0)),
                  SizedBox( height: 60.0 ),
                  _createEmail( bloc ),
                  SizedBox( height: 30.0 ),
                  _createPassword( bloc ),
                  SizedBox( height: 30.0 ),
                  _createButton( bloc )
                ],
              ),
            ),
          ),

          Text('¿Olvidaste la contraseña?'),
          SizedBox( height: 100.0 )
        ],
      ),
    );


  }

  Widget _createEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.blue[800] ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),

      );


      },
    );


  }

  Widget _createPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.blue[800] ),
              labelText: 'Contraseña',
              

              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),

        );

      },
    );


  }

  Widget _createButton( LoginBloc bloc) {

    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 50.0, vertical: 15.0),
            child: Text('Iniciar Sesión'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.blue[800],
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async{

      Navigator.pushNamed(context, 'home');
  }

    /*Map info = await usuarioProvidier.login(bloc.email, bloc.password);

    if( info['ok'] ){

      Navigator.pushReplacementNamed(context, 'home');
    }
    else{
      showAlert( context, info['mensaje'] );
    }

    //Navigator.pushReplacementNamed(context, 'home');

  }*/


  Widget _createBackground(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Colors.white,
            Colors.white
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(100, 140, 255, 0.10)
      ),
    );


    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned( top: 90.0, left: 30.0, child: circulo ),
        Positioned( top: -40.0, right: -30.0, child: circulo ),
        Positioned( bottom: -50.0, right: -10.0, child: circulo ),
        Positioned( bottom: 120.0, right: 20.0, child: circulo ),
        Positioned( bottom: -50.0, left: -20.0, child: circulo ),
        
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Icon( Icons.person, color: Colors.blue[800], size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('', style: TextStyle( color: Colors.white, fontSize: 25.0 ))
            ],
          ),
        )

      ],
    );

  }

}