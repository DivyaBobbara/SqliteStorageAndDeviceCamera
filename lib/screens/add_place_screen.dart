import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/great_places.dart';
import '../widgets/images_input.dart';
import 'dart:io';
import '../widgets/location_input.dart';

class AddPlaceScren extends StatefulWidget {
  static const routeName = "AddPlaceScren";

  const AddPlaceScren({Key? key}) : super(key: key);

  @override
  State<AddPlaceScren> createState() => _AddPlaceScrenState();
}

class _AddPlaceScrenState extends State<AddPlaceScren> {
  final titleController = TextEditingController();
  File? _pickedImg;

  void _selectImage(File pickedImg) {
    _pickedImg = pickedImg;
  }

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImg == null) {
        return;
    }
    Provider.of<GreatPlaces>(context,listen: false).addPlace(titleController.text, _pickedImg ?? File('String'));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'title'),
                  controller: titleController,
                ),
                ImageInput(onSelectImage: _selectImage),
                SizedBox(height: 10,),
                LocationInput(),

              ],
            ),
          )),
          ElevatedButton(onPressed:_savePlace, child: Text(' + Add Place'))
        ],
      ),
    );
  }
}
