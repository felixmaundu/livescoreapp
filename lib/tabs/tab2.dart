import 'package:flutter/material.dart';
import 'package:livescoreapp/Models/pastMatches_model.dart';

import 'package:livescoreapp/manager/api_manager.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {


  

 Future<PastMatchesModel> _pastMatchesModel;

 

  

  @override
  void initState() {
    _pastMatchesModel = Api_Manager().getPastMatches();

    super.initState();
  }


 @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black12,//[700],
      // appBar: AppBar(
      //   title: Text('Livescore'),
      //   backgroundColor: Colors.blue[900],
      // ),
     
      body: Container(

       

        child: FutureBuilder <PastMatchesModel> (
               
          future: _pastMatchesModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             
              return ListView.builder(
                   //itemCount: widget.livemodels.length,
                   //.data.data.match.length,
                  itemCount: snapshot.data.data.match.length,
                   //itemCount: snapshot.data.data.goalscorers.length,
                  itemBuilder: (context, index) {

                      

                    var pastMatch = snapshot.data.data.match[index];


                    var hometeam = pastMatch.homeName;
                    var awayteam = pastMatch.awayName;
                    var ft = pastMatch.score;
                    var ht = pastMatch.htScore;
                   // var status = pastMatch.status;
                    var time = pastMatch.time;
                    var scheduled = pastMatch.scheduled;

                    //var ;
                    
                   if (scheduled == null) scheduled = "";
                   // if (time ==  Time.FT) time = '$ft';
              return  Container(
                
                 child : GestureDetector(
                    
                  // onTap: () {
                  //       Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => LiveDetailsPage(
                  //               liveModel: liveModels[index]                                                       )
                  //                ),
                  //               );
                  //          }, 


                    child:  Card (
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
                                  child:Text(
                                  '''FT \n $ft \n''', //$status
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                color: Colors.green,
                                    fontSize: 11.0,
                                     ),
                                    ),
                                    )
                                   ),


              
               
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
                            )


                           );
                 
             } );
            } else
              return Center(child: CircularProgressIndicator( ));
          },
        ),
      ),
    );
  }
}
//}