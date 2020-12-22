import 'package:flutter/material.dart';
import 'package:livescoreapp/new_models/past_match_model.dart';

class PastPage extends StatelessWidget {
  final List<PastMatchModel> past;

  const PastPage({Key key, @required this.past}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView.builder(
        itemCount: past.length,
        itemBuilder: (context, index) {
          var pastMatch = past[index];

          var hometeam = pastMatch.homeName;
          var awayteam = pastMatch.awayName;
          var ft = pastMatch.score;
          var ht = pastMatch.htScore;
          // var status = pastMatch.status;
          var time = pastMatch.time;
          var scheduled = pastMatch.scheduled;
          if (scheduled == null) scheduled = "";

          return GestureDetector(
            onTap: () {
              //TODO: navidate to another detail page here
            },
            child: Card(
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '''$scheduled \n HT \n $ht''', //$status
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 11.0,
                      ),
                    ),

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

                    Expanded(
                        child: Center(
                      child: Text(
                        '''FT \n $ft \n''', //$status
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 11.0,
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
                      '$time', //$status
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),

                    Divider(
                      color: Colors.white,
                    ), //
                  ],
                )),
          );
        },
      ),
    );
  }
}
