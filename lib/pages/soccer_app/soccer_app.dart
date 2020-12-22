import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livescoreapp/bloc/livescore_bloc.dart';
import 'package:livescoreapp/injection.dart';
import 'package:livescoreapp/pages/tabs/fixtures_page.dart';
import 'package:livescoreapp/pages/tabs/live_page.dart';
import 'package:livescoreapp/pages/tabs/past_page.dart';
import 'package:livescoreapp/pages/tabs/tab1.dart';
import 'package:livescoreapp/pages/tabs/tab2.dart';
import 'package:livescoreapp/pages/tabs/tab3.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  //livemodels: [],

  int _index = 0;
  PageController _pageController;

  //define bloc
  LivescoreBloc _bloc;

  //init state is the page initializer
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    //initialize bloc with the service locator
    _bloc = getIt<LivescoreBloc>();

    //get matches event initialize when you open this page
    _bloc.add(GetMatchesEvent());
  }

  //always dispose to prevent leaks
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();

    _bloc.close();
  }

  //use pageview
  // final List<Widget> _tabs = [Tab1Page(), Tab2Page(), Tab3Page()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LivescoreBloc>(
      create: (context) => _bloc,
      child:
          BlocBuilder<LivescoreBloc, LivescoreState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is Error) {
          return Container(
            child: Center(
              child: Expanded(
                child: Text(state.message),
              ),
            ),
          );
        }
        if (state is Success) {
          return Scaffold(
            backgroundColor: Colors.black54,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              elevation: 10.0,
              title: Text("My soccer App",
                  style: TextStyle(color: Colors.orange) //.black),
                  ),
              centerTitle: true,
            ),

            //now we have finished the api service let's call it
            //Now befo re we create Our layout let's create our API service

            body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _index = index);
                },
                children: [
                  // Tab1Page(),
                  LivePage(
                    live: state.live,
                  ),

                  // Tab2Page(),
                  PastPage(
                    past: state.past,
                  ),

                  // Tab3Page(),
                  FixturesPage(
                    fixtures: state.fixtures,
                  ),
                ],
              ),
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _index,
              onTap: (index) => setState(() {
                _pageController.jumpToPage(index);
              }),
              backgroundColor: Colors.black54,
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.orange,
                  ),
                  // title: Text('live',
                  //     style: TextStyle(
                  //       color: Colors.blue,
                  //     )),
                  label: "Live",
                  activeIcon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.blue,
                  ),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_rounded,
                    color: Colors.orange,
                  ),
                  // title: Text('past matches',
                  //     style: TextStyle(
                  //       color: Colors.blue,
                  //     )),
                  label: "Past",
                  activeIcon: Icon(
                    Icons.list_rounded,
                    color: Colors.blue,
                  ),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.orange,
                  ),
                  // title: Text('news',
                  //     style: TextStyle(
                  //       color: Colors.blue,
                  //     )),
                  label: "News",
                  activeIcon: Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),
                ),
                //  new BottomNavigationBarItem(
                //   icon: Icon(Icons.trending_up_outlined,
                //   color: Colors.orange,
                //   ),
                //   // title: Text('news',
                //   //  style:TextStyle(
                //   //     color:Colors.blue,
                //   //   )
                //   // ),
                //   label: "news",
                //   activeIcon: Icon(
                //     Icons.trending_up_outlined,
                //     color: Colors.blue,
                //   ),
                // ),
              ],
            ),
          );
        }
        //initial state 
        return Container();
      }),
    );
  }
}
