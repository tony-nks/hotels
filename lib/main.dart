import 'package:flutter/material.dart';
import 'package:hotels/views/hotel_details_screen.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/not_found_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings){
          switch (settings.name) {
            case HomeView.routeName : return MaterialPageRoute(builder: (BuildContext context) {return HomeView();});
            case HotelDetailsScreen.routeName :
              final argumets = settings.arguments as String;
              return MaterialPageRoute(builder: (BuildContext context){
                return HotelDetailsScreen( addressroute: argumets,);
              });
          }
          return MaterialPageRoute(builder: (BuildContext context) {return NotFoundPage();});
      },
      home: HomeView(),
    );
  }
}
