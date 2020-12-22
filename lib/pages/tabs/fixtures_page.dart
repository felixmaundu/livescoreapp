import 'package:flutter/material.dart';
import 'package:livescoreapp/new_models/fixtures_model.dart';

class FixturesPage extends StatelessWidget {
  final List<FixturesModel> fixtures;

  const FixturesPage({Key key, @required this.fixtures}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12, //[700],
      body: ListView.builder(
        itemCount: fixtures.length,
        itemBuilder: (context, index) {
          var game = fixtures[index];
          var hometeam = game.homeName;
          var awayteam = game.awayName;
          // var score = game.score;
          // var time =   game.time;
          // var ht = game.htScore;

          return GestureDetector(
            onTap: () {
              //TODO: add another detail screen for fixtures
            },
            child: Card(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    color: Colors.blueGrey,
                  ), //

                  // Expanded(
                  //        child: Center(
                  //          child: Text(
                  //          '''$ht''',
                  //          textAlign: TextAlign.justify,
                  //          style: TextStyle(
                  //           color: Colors.green,
                  //           fontSize: 18.0,
                  //              ),
                  //             ),
                  //           )
                  //         ),

                  Expanded(
                    child: Text(
                      '$hometeam ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  // Expanded(
                  //   child: Center(
                  //      child: Text(
                  //       '''$time \n $score''',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.green,
                  //       fontSize: 18.0,
                  //          ),
                  //        ),
                  //       )
                  //     ),

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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
