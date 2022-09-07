// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where/providers/where_places.dart';
import 'package:where/screens/add_places_screen.dart';
import 'package:where/screens/places_details_screen.dart';
import 'package:where/screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: WherePlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WHERE',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(secondary: Colors.white),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (context) => AddPlacesScreen(),
          PlaceDetailScreen.routeName: (context) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
