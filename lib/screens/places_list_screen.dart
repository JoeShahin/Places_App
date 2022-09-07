// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where/providers/where_places.dart';
import 'package:where/screens/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WHERE PLACES'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<WherePlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot
                    .connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<WherePlaces>(
                child: Center(
                  child: Text('Got no places yet, start adding some!'),
                ),
                builder: (context, whereplaces, ch) => whereplaces.items.isEmpty
                    ? ch!
                    : ListView.builder(
                        itemCount: whereplaces.items.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(whereplaces.items[index].image!),
                          ),
                          title: Text(whereplaces.items[index].title),
                          subtitle: Text(
                            whereplaces.items[index].location!.address
                                .toString(),
                          ),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
