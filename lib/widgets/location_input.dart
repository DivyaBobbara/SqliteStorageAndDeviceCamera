import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImgUrl;


  Future<void> _getCurrentUserLocation() async {
    final localData = await Location().getLocation();
    print('${localData.latitude},lattitude');
    print('${localData.longitude},longitude');

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          width: double.infinity,
          child: previewImgUrl == null ? Text(
            'no location chosen', textAlign: TextAlign.center,) :
          Image.network(previewImgUrl!,fit: BoxFit.cover,),


        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(onPressed: _getCurrentUserLocation, icon: Icon(Icons.location_on), label: Text('Current Location')),
            ElevatedButton.icon(onPressed: () { }, icon: Icon(Icons.map), label: Text('Select on map')),
          ],
        ),

      ],
    );
  }
}
