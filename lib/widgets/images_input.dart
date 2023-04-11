import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({required this.onSelectImage});


  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? image;

  Future<void> _takePicture() async {
    final imgFile = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 600);
    if(imgFile == null) {
      return;
    }
    setState(() {
      image = File(imgFile?.path ?? '') ;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imgFile?.path ?? '');
    final File file = File(imgFile?.path ?? '');
    final savedImg = await file.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImg);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(height: 100, width: 200, decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey,)),
            child: image != null ? Image.file(image!) : Text("no image selected",textAlign: TextAlign.center,),
          alignment: Alignment.center,
          ),
        SizedBox(width: 20,),
        Expanded(
          child: TextButton.icon(onPressed:_takePicture,
              icon: Icon(Icons.camera),
              label: Text('select picture')),
        ),
      ],
    );
  }
}
