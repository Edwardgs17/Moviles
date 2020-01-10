import 'package:Inversiones/src/pages/Users/sideBar.dart';
import 'package:Inversiones/src/providiers/ProjectsProvidier/projects_providier.dart';
import 'package:flutter/material.dart';
import 'package:Inversiones/src/bloc/provider.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final projectsProvidier = new ProjectsProvidier();

  @override
  Widget build(BuildContext   context) {

    final bloc = Provider.of(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('ColFunding'),
        centerTitle: true,
        
        ),

        drawer: SideBar(),
      body: _createList(),

      floatingActionButton: _createButton(context),

      );
  }

  Widget _createList(){

    return FutureBuilder(
      future: projectsProvidier.loadProject(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        if(snapshot.hasData){

            final projects=snapshot.data;

            return ListView.builder(
              itemCount:projects.length ,
              itemBuilder: (context, i) => _createItem(context, projects[i]),


            );

            }else{

              return Center(child: CircularProgressIndicator());

             }
          },
    );
  }

    Widget _createItem(BuildContext context, dynamic project ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        projectsProvidier.deleteProject(project['project_id'].toString());

      },
      child: Card(
        child: Column(
          children: <Widget>[

           /* ( project.photoUrl == null )

              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( project.photoUrl ),
                placeholder: AssetImage('assets/time-money.gif'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),*/

            
            ListTile(
              title: Text('${ project["name"] } - ${ project["minimal_cost"] }', style: TextStyle(fontSize:20,color: Colors.blue[800])),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text( project['description'] , style: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
              onTap: () => Navigator.pushNamed(context, 'project', arguments: project ),
            ),

          ],
        ),

      )
  
    );
  }

 _createButton(BuildContext context){

      return FloatingActionButton(child: Icon(Icons.add),
      backgroundColor: Colors.blue[800],
        onPressed: () { 
          Navigator.pushNamed(context, 'project');

          setState(() {
            
          });
        }
      );
    }
}