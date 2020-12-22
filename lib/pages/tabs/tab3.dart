import 'package:flutter/material.dart';
import 'package:livescoreapp/Models/fixture_model.dart';
import 'package:livescoreapp/manager/api_manager.dart';

class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> {
  Future<FixtureModel> _fixtureModel;

  @override
  void initState() {
    _fixtureModel = Api_Manager().getFixture();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12, //[700],

      body: Container(
        child: FutureBuilder<FixtureModel>(
          future: _fixtureModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // itemCount: liveModels.length,
                  //.data.data.match.length,
                  itemCount: snapshot.data.data.match.length,
                  itemBuilder: (context, index) {
                    var game = snapshot.data.data.match[index];
                    var hometeam = game.homeName;
                    var awayteam = game.awayName;
                    // var score = game.score;
                    // var time =   game.time;
                    // var ht = game.htScore;

                    return Container(
                        child: GestureDetector(
                      // onTap: () {
                      //       Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => LiveDetailsPage(
                      //               liveModel: liveModels[index]                                                       )
                      //                ),
                      //               );
                      //          },

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

                              // Tab2Page()
                            ],
                          )),
                    ));
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

// // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/material.dart';

// class Todo {
//   final String title;
//   final String description;

//   Todo(this.title, this.description);
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'Passing Data',
//     home: TodosScreen(
//       todos: List.generate(
//         20,
//         (i) => Todo(
//           'Todo $i',
//           'A description of what needs to be done for Todo $i',
//         ),
//       ),
//     ),
//   ));
// }

// class TodosScreen extends StatefulWidget {
//   final List<Todo> todos;

//   TodosScreen({Key key, @required this.todos}) : super(key: key);

//   @override
//   _TodosScreenState createState() => _TodosScreenState();
// }

// class _TodosScreenState extends State<TodosScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todos'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.todos.length,
//         itemBuilder: (context, index) {

//           var game = widget.todos[index];

//           return ListTile(
//             title: Text('$game'
//               //widget.todos[index].title
//               ),
//             // When a user taps the ListTile, navigate to the DetailScreen.
//             // Notice that you're not only creating a DetailScreen, you're
//             // also passing the current todo through to it.
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(
//                     todo: widget.todos[index]
//                     ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class DetailScreen extends StatefulWidget {
//   // Declare a field that holds the Todo.
//   final Todo todo;

//   // In the constructor, require a Todo.
//   DetailScreen({Key key, @required this.todo}) : super(key: key);

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var title = widget.todo.title;
//     // Use the Todo to create the UI.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$title',
//          // widget.todo.title
//           ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(widget.todo.description),
//       ),
//     );
//   }
// }
