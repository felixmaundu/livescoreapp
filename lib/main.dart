
import 'package:flutter/material.dart';


import 'package:livescoreapp/tabs/tab1.dart';
import 'package:livescoreapp/tabs/tab2.dart';
import 'package:livescoreapp/tabs/tab3.dart';



void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //Tab1Page(livemodel: liveModels,)
      SoccerApp()
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {

   int _index = 0;
   //livemodels: [],
 
  final List<Widget> _tabs = [Tab1Page(), Tab2Page(), Tab3Page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,  
        elevation: 10.0,
        title: Text(
          "My soccer App",
          style: TextStyle(color: Colors.orange ) //.black),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service


      









       body:  _tabs[_index],
       
      bottomNavigationBar: BottomNavigationBar(
      
        currentIndex: _index,
        onTap: (index) => setState(() {
          _index = index;
        }),
        backgroundColor: Colors.black54,
        items: [
          new BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline,
                  color: Colors.orange,
                ),
             title: Text('live',
             style:TextStyle(
             color:Colors.blue,
              )
            ),
            
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded,
             color: Colors.orange,
             
            ),
            title: Text('past matches',
             style:TextStyle(
                color:Colors.blue,
              )
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.info_outline,
            color: Colors.orange,
            ),
            title: Text('news',
             style:TextStyle(
                color:Colors.blue,
              )
            ),
          ),
          //  new BottomNavigationBarItem(
          //   icon: Icon(Icons.trending_up_outlined,
          //   color: Colors.orange,
          //   ),
          //   title: Text('news',
          //    style:TextStyle(
          //       color:Colors.blue,
          //     )
          //   ),
          // ),
        ],
      ),
    );
  }
}
