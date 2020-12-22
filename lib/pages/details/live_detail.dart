import 'package:flutter/material.dart';
import 'package:livescoreapp/new_models/match_model.dart';

class LiveDetailsPage extends StatelessWidget {
  final MatchModel live;

  const LiveDetailsPage({Key key, @required this.live}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(

          //test if arguments works
          child: Text(
            "The home team name is "+live.homeName+"\nThe away team name is"+live.awayName
          ),
        ),
      ),
    );
  }
}
