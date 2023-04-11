import 'package:flutter/material.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './screens/add_place_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen() ,
        routes: {
          AddPlaceScren.routeName : (ctx) => AddPlaceScren(),
        },
      ),
    );
  }
}
