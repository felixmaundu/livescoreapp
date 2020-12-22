import 'package:flutter/material.dart';
import 'package:livescoreapp/Models/live_model.dart';

import 'package:livescoreapp/manager/api_manager.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {
  Future<LiveModel> liveModels;

  //var live;

  @override
  void initState() {
    liveModels = Api_Manager().getLive();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: FutureBuilder<LiveModel>(
          future: liveModels,
          builder: (context, AsyncSnapshot<LiveModel> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.match.length,
                  itemBuilder: (context, index) {
                    //length: game.
                    var game = snapshot.data.data.match[index];
                    var hometeam = game.homeName;
                    var awayteam = game.awayName;
                    var score = game.score;
                    var time = game.time;
                    var ht = game.htScore;
                    var startAt = game.scheduled;
                    var status = game.status;
                    if (status == "NOT STARTED") status = "$time";
                    if (status == "NOT STARTED") ht = "";

                    return Container(
                      // child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LiveDetailPage(
                      //       live: live[index]
                      //       ),
                      //   ),
                      // );
                      //},

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
                    ); //),);
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
