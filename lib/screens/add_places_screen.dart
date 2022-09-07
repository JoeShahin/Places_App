// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, unused_field, unused_element, unnecessary_null_comparison
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where/models/place.dart';
import 'package:where/providers/where_places.dart';
import 'package:where/widgets/input_image.dart';
import 'package:where/widgets/location_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add places screen';
  AddPlacesScreen({Key? key}) : super(key: key);

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  late File _pickedImage;
  PlaceLocation? _pickedLocation;

  _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(
      latitude: lat,
      longitude: lng,
    );
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<WherePlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
        ],
      ),
    );
  }
}
