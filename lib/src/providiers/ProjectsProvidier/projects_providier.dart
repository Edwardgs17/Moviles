import 'dart:convert';

import 'package:http/http.dart' as http;

//import 'package:Inversiones/src/preferences/preferences_users.dart';


class ProjectsProvidier{


  final String _http = 'http://10.0.2.2:3000/ms';
  //final _prefs = PreferencesUsers();
  

  Future<bool> createProject( dynamic project ) async{

    final url= '$_http/projects';//?auth=${_prefs.token}';

     final resp = await http.post(url, body: project.toString());
     print(project);
     print(resp.body);
    //  final decodeData= json.decode(resp.body);

     //print(decodeData);


     return json.decode(resp.body);


  }

    Future<List<dynamic>> loadProject() async{


    final url= '$_http/projects';
    final res= await http.get(url);  
    
    final Map<String, dynamic> decodedData = json.decode(res.body);
    
    final List<dynamic> project =decodedData['lists'];
    print("reiniciar"+project[0]['project_id'].toString());

    if ( decodedData == null ) return [];

    // decodedData.forEach( ( projectId, proj ){

    //   final projTemp = ProjectModel.fromJson(proj);
    //   projTemp.projectId = projectId;

    //   project.add( projTemp );

    // });

    // print( productos[0].id );
    return project;

  }

    Future<bool> editProject( dynamic project ) async {
    
    final url = '$_http/projects/${ project["project_id"] }';  //?auth=${_prefs.token}';

    final resp = await http.put( url, body: {});

    final decodedData = json.decode(resp.body);

    print( decodedData );
    

    return true;

  }
  Future<int> deleteProject( String id ) async { 

    final url  = '$_http/projects/$id';  //?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


}