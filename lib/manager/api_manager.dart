import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' show Client;
import 'package:livescoreapp/Models/fixture_model.dart';
import 'package:livescoreapp/Models/live_model.dart';

import 'package:livescoreapp/Models/pastMatches_model.dart';

import 'package:livescoreapp/Models/topScorers_model.dart';
import 'package:livescoreapp/strings/strings.dart';




// ignore: camel_case_types
class Api_Manager{ 

        
        
  Future<LiveModel> getLive() async {
    var client = http.Client();
    // final liveModel = <LiveModel>[];
    var liveModel;

    try {
      var response = await client.get(Strings.livescoreUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        liveModel = LiveModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return liveModel;
    }

    return liveModel;
  }


  
  Future<FixtureModel> getFixture() async {
    var client = http.Client();
    var fixtureModel;

    try {
      var response = await client.get(Strings.fixturesUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        fixtureModel = FixtureModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return fixtureModel;
    }

    return fixtureModel;
  }
   



   
  Future<PastMatchesModel> getPastMatches() async {
    var client = http.Client();
    var pastMatchesModel;

    try {
      var response = await client.get(Strings.pastMatches);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        pastMatchesModel = PastMatchesModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return pastMatchesModel;
    }

    return pastMatchesModel;
  }



   Future<TopScoresModel> getTopScores() async {
    var client = http.Client();
    var topScorersModel;

    try {
      var response = await client.get(Strings.topScorersUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        topScorersModel = TopScoresModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return topScorersModel;
    }

    return topScorersModel;
  }















}



















//  //static String predictionUrl = "https://soccer.sportmonks.com/api/v2.0/predictions/probabilities/next?api_token=tgGa1tCERBduI9zJiXhzvtzYt2OP6G7jTxxw1TGkHgmCFeYDBCi1gk1a2FtA";
//  final  predictionUrl = "https://v3.football.api-sports.io/predictions?fixture=198772";
//  final apikey = "db4a61e7380bd231259557794a6145d5";


//  class Newtype{ 
//      Client client = Client();
//   Future<PredictionModel> getPredictions() async {
//     final response = await client.get('$predictionUrl$apikey');

    
//     if (response.statusCode == 200) {
//       return PredictionModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load genres');
//     }
//   }

// //  Future<PredictionModel> getPredictions(/*int id*/) async {
// //    //final response = await client.get('$nowPlayingUrl');
// //     var client = http.Client();
// //     var predictionModel;

// //     try {
// //       var response = await client.get(Strings.predictionUrl+topScorers);
// //       if (response.statusCode == 200) {
// //         var jsonString = response.body;
// //         var jsonMap = json.decode(jsonString);

// //         predictionModel = PredictionModel.fromJson(jsonMap);
// //       }
// //     } catch (Exception) {
// //       return predictionModel;
// //     }

//     //return predictionModel;
//  // }







//  }


