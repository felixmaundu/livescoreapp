import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livescoreapp/new_models/match_model.dart';
import 'package:livescoreapp/route/router.gr.dart';

class LivePage extends StatelessWidget {
  final List<MatchModel> live;

  const LivePage({Key key, @required this.live}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView.builder(
        itemCount: live.length,
        itemBuilder: (context, index) {
          var game = live[index];
          var hometeam = game.homeName;
          var awayteam = game.awayName;
          var score = game.score;
          var time = game.time;
          var ht = game.htScore;
          var startAt = game.scheduled;
          var status = game.status;
          if (status == "NOT STARTED") status = "$time";
          if (status == "NOT STARTED") ht = "";

          return GestureDetector(

            //how you pass arguments..lazima zifanane
            onTap: () => ExtendedNavigator.of(context).push(
                Routes.liveDetailsPage,
                arguments: LiveDetailsPageArguments(live: live[index])),
            child: Card(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    color: Colors.blueGrey,
                  ), //

                  Text(
                    "  ht \n" + '$ht',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 9.0,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      //'$hometeam ',
                      game.homeName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  Expanded(
                      child: Center(
                    child: Text(
                      '''$time \n $score \n''', //$status
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                      ),
                    ),
                  )),

                  Expanded(
                    child: Text(
                      '$awayteam',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  Text(
                    '$startAt',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 9.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
