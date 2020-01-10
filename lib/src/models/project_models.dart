import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';


ProjectModel projectFromJson(dynamic) => ProjectModel.fromJson(json.decode(dynamic));

String projectToJson(ProjectModel data) => json.encode(data.toJson(dynamic));


@JsonSerializable()
class ProjectModel {

    String projectId;
    String entrepreneur;
    String name;
    String objectives;
    String description;
    String socialCommitment;
    int minimalCost;
    int optimalCost;
   // String photoUrl;

    ProjectModel({

        this.entrepreneur='',
        this.name='',
        this.objectives='',
        this.description='',
        this.socialCommitment='',
        this.minimalCost= 0,
        this.optimalCost=0,
        //this.photoUrl,
    });

  /*  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(

        projectId         :   json["project_id"],
        name              :   json["name"],
        objectives        :   json["objectives"],
        description       :   json["description"],
        socialCommitment  :   json["social_commitment"],
        minimalCost       :   json["minimal_cost"],
        optimalCost       :   json["optimal_cost"],

    );*/

 ProjectModel.fromJson(Map<String, dynamic> json):

        entrepreneur      =   json["entrepreneur"],
        name              =   json["name"],
        objectives        =   json["objectives"],
        description       =   json["description"],
        socialCommitment  =   json["social_commitment"],
        minimalCost       =   json["minimal_cost"],
        optimalCost       =   json["optimal_cost"];


    Map<String, dynamic> toJson(dynamic) => {

        //"id"              :   id,
        "name"              :   name,
        "objectives"        :   objectives,
        "description"       :   description,
        "social_commitment" :   socialCommitment,
        "minimal_cost"      :   minimalCost,
        "optimal_cost"      :   optimalCost,

    };
}