import 'dart:core' show Duration, String, bool, dynamic, int, override, print;
import 'dart:io';

import 'package:Inversiones/src/models/project_models.dart';
import 'package:Inversiones/src/providiers/ProjectsProvidier/projects_providier.dart';
import 'package:flutter/material.dart';
import 'package:Inversiones/src/utils/logic.dart' as logica;

import 'package:Inversiones/src/providiers/ImagesProvidier/image_providier.dart';

class ProjectPage extends StatefulWidget {

  

  @override
  _ProjectPageState createState() => _ProjectPageState();
  
}

class _ProjectPageState extends State<ProjectPage> {


  final imagesProvidier = new ImagesProvidier();
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final proyectoProvidier = new ProjectsProvidier();
  final ProjectModel projects= new ProjectModel();

  dynamic project = {};

  bool _save = false;
  File photo;

  @override
  Widget build(BuildContext context) {

    final dynamic projData = ModalRoute.of(context).settings.arguments;
    if(projData !=null ){
      project = projData;
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('ColFunding'),
        centerTitle: true,

            actions: <Widget>[
              //IconButton( 
                //icon: Icon(Icons.photo_size_select_actual),
                //onPressed: _selectPhoto,

             // ),

              //IconButton( 
                //icon: Icon(Icons.camera_alt),
               // onPressed: _takeAPicture,
               // ),
            ],
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(15.0),

          child: Form(
              key: formKey,

            child: Column(
                children: <Widget>[
                // _showPhoto(),
                _createEntrepreneur(),
                _createName(),
                _createObjectives(),
                _createDescription(),
                _createSocialCommitment(),
                _createMinimalCost(),
                _createOptimalCost(),
                //_createQualification(),
                _createButton(),
                ],
            ),
          ),

          ),
        ),
      
    );
  }
        Widget  _createEntrepreneur(){

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(

              initialValue: project['entrepreneur'],
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                
                labelText: 'Nombre del proyecto',
              ),

            onSaved: (value) => project['entrepreneur']= value,
             validator: ( value ){

                if( value.length<3 ){

                    return 'Ingrese nombre del proyecto';
                }
                else{
                  return null;
                }
              }
            ),
          );
          
         }


      Widget  _createName(){

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(

              initialValue: project['name'],
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                
                labelText: 'Nombre del proyecto',
              ),

            onSaved: (value) => project['name']= value,
             validator: ( value ){

                if( value.length<3 ){

                    return 'Ingrese nombre del proyecto';
                }
                else{
                  return null;
                }
              }
            ),
          );
          
         }

   Widget _createObjectives(){

     return Padding(
       padding: const EdgeInsets.only(top: 15),
       child: TextFormField(

         initialValue: project['objectives'],
         textCapitalization: TextCapitalization.sentences,
         decoration: InputDecoration(

            labelText: 'Objetivos del proyecto',
         ),
                     onSaved: (value) => project['objectives']= value,
             validator: ( value ){

                if( value.length<3 ){

                    return 'Ingrese nombre del proyecto';
                }
                else{
                  return null;
                }
              }
       ),
     );
   }


  Widget _createDescription() {

   return Padding(
       padding: const EdgeInsets.only(top: 15),
       child: TextFormField(

         initialValue: project['description'],
         textCapitalization: TextCapitalization.sentences,
         decoration: InputDecoration(

            labelText: 'Descripcion del proyecto',
         ),
                     onSaved: (value) => project['description']= value,
             validator: ( value ){

                if( value.length<10 ){

                    return 'Ingrese la descripcion del proyecto';
                }
                else{
                  return null;
                }
              }
       ),
     );
    
    }

  Widget _createSocialCommitment(){

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(

       initialValue: project['social_commitment'],
       textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(

          labelText: 'Razon social',
        ),
      onSaved: (value) => project['social_commitment']= value,
             validator: ( value ){

                if( value.length<10 ){

                    return 'Ingrese la razon social del proyecto';
                }
                else{
                  return null;
                }
              }
      ),
    );
  }

       Widget  _createMinimalCost(){

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(

              initialValue: projects.minimalCost.toString(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(     
              labelText: 'Costo minimo a invertir en el proyecto',

              ),

              onSaved: ( value ) => projects.minimalCost= int.parse( value ),
              
              validator: ( value ){

                  if( logica.isNumeric( value )){

                    return null;

                  }
                  else{

                    return 'Solo numeros';
                  }
               }  
            ),
          );
   }

   Widget _createOptimalCost(){

     return Padding(
       padding: const EdgeInsets.only(top: 15),
       child: TextFormField(

          initialValue: projects.optimalCost.toString(),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            
            labelText: 'Costo Optimo para el proyecto'

            ),

              onSaved: ( value ) => projects.optimalCost = int.parse( value ),
              
              validator: ( value ){

                  if( logica.isNumeric( value )){

                    return null;

                  }
                  else{

                    return 'Solo numeros';
                  }
              }

       ),
     );
   }
      Widget  _createButton(){

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RaisedButton.icon(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              textColor: Colors.white,
              color: Colors.blue[800],
              label: Text('Guardar'),
              icon: Icon(Icons.save),
              onPressed: ( _save ) ? null : _submit,
              
              
                   
            ),
          ); 
      }

      void _submit() async{

        if( !formKey.currentState.validate( ) ) return;

        formKey.currentState.save();

        setState(() {_save = true; }); print("aca");    print(project);

    /*if ( photo != null ) {
      project.photoUrl = await imagesProvidier.uploadImage(photo);
    }*/

    if (project['project_id'] == null ) {
      proyectoProvidier.createProject(project).toString();
    } else {
      proyectoProvidier.editProject(project);
    }


    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);

  }


  void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 1500),
    );
  }


  /*Widget _showPhoto() {

    if ( project.photoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage(project.photoUrl ),
        placeholder: AssetImage('assets/time-money.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage( photo?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }

  }


  _selectPhoto() async {

     photo = await ImagePicker.pickImage(
      source: ImageSource.gallery
    );

    if ( photo != null ) {
      project.photoUrl = null;
    }

    setState(() {});

  }
  
  
  _takeAPicture() async {


    photo = await ImagePicker.pickImage(
      source: ImageSource.camera
    );

    if ( photo != null ) {
      project.photoUrl = null;
    }

    setState(() {});

  }
    

  }*/

}