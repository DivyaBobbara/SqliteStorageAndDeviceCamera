import 'package:flutter/material.dart';
import './add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScren.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context,listen: false).fetchPlaces(),
        builder: (ctx, snapshot) => Consumer<GreatPlaces>(
            child: Text('no places yet'),
            builder: (ctx, greatPlaces, ch) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : (greatPlaces.items.length <= 0)
                        ? ch as Widget
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, ind) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[ind].image),
                              ),
                              title: Text(greatPlaces.items[ind].title),
                              onTap: () {},
                            ),
                          )),
      ),
    );
  }
}
