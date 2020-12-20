import 'package:flutter/material.dart';
import 'package:livescoreapp/Models/live_model.dart';





class LiveDetailPage extends StatefulWidget {
 
  final LiveModel live;
  LiveDetailPage({Key key,this.live}) : super(key: key);
 
  @override
  _LiveDetailPageState createState() => _LiveDetailPageState(live);
}

class _LiveDetailPageState extends State<LiveDetailPage> {
  _LiveDetailPageState(LiveModel live);

  @override
  Widget build(BuildContext context) {
     
    

    return Scaffold(
    
    );
  }
}






























// class LiveDetailsPage extends StatefulWidget {

//   final LiveModel livemodel;

//   // In the constructor, require a Todo.
//   LiveDetailsPage({Key key, @required this.livemodel}) : super(key: key);


//   @override
//   _LiveDetailsPageState createState() => _LiveDetailsPageState(livemodel);
// }

// class _LiveDetailsPageState extends State<LiveDetailsPage> {

//   final LiveModel livemodel;
//   _LiveDetailsPageState(this.livemodel);


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.black12,
      
     
//       body: Container(

       

//         child: FutureBuilder <LiveModel> (
               
         
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
             
//               return ListView.builder(
//                    itemCount: liveModel.data.match.length,
                  
//                   itemBuilder: (context, index) {

//                       var game = widget.liveModel.data.match[index];
//                       var hometeam = game.homeName;

                 
//               return  Container(
                
//                  child : GestureDetector(
                    
                  


//                     child:  Card (
//                 color: Colors.black12,  
//                        child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[

                  

//                        Expanded(
//                          child: Text(
//                             "hello",
//                              ),
//                           ),                         
//                     ],
         
//                            )),
//                             )
//                            );
                 
//              } );
//             } else
//               return Center(child: CircularProgressIndicator( ));
//           },
//         ),
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





































































































// // // // import 'package:flutter/foundation.dart';
// // // // import 'package:flutter/material.dart';



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