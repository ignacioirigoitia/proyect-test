import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compress_test/diferent_reactions.dart';
import 'package:flutter_compress_test/video_section.dart';
import 'package:video_compress/video_compress.dart';



class HomeReactions extends StatefulWidget {
  const HomeReactions({ Key? key }) : super(key: key);

  @override
  _HomeReactionsState createState() => _HomeReactionsState();
}

class _HomeReactionsState extends State<HomeReactions> {

  bool isReaction = false;
  File? fileVideo;
  Uint8List? thumbnailBytes;
  int? videoSize;
  MediaInfo? compressedVideoInfo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('Este es un Ekko hermoso que a Rodri no le gusta', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              SizedBox(height: 20),
              Container(
                child: Image(image: AssetImage('assets/ekko.jpeg')),
                width: 300,
                height: 300,
              ),
              if(fileVideo != null)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 300,
                  child: ElevatedButton(
                    onPressed: clearSelection,
                    child: Center(child: Text('Borrar video')),
                  ),
                ),
              SizedBox(height: 20),
              if (fileVideo == null)
                ElevatedButton(
                  onPressed: this.pickVideo
                  // () async {
                  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
                  //     type: FileType.custom,
                  //     allowedExtensions: ['mp4'],
                  //     allowMultiple: false
                  //   );

                  //   if (result != null) {
                  //     print(result.files.first.extension);
                  //     print(result.files.first.name);
                  //     print(result.files.first.size);
                  //     print(lookupMimeType(result.files.first.name));
                  //     final file = File(result.files.first.name);
                  //     setState(() => fileVideo = file);
                  //     generateThumbnail(fileVideo!);
                  //     getVideoSize(fileVideo!);
                  //   } else {
                  //     print('No se selecciono ningun archivo');
                  //   }
                  // }
                  , 
                  child: Container(
                    height: 40,
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Spacer(),
                        Text('Elegir archivo')
                      ],
                    ),
                  )
              ),
              if(fileVideo != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildThumbnail(),
                    SizedBox(height: 20),
                    buildVideoInfo(),
                    SizedBox(height: 20),
                    buildVideoCompressInfo(),
                    SizedBox(height: 20),
                    if(compressedVideoInfo == null)
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: compressVideo, 
                          child: Center(
                            child: Text('Comprimir video'),
                          )
                        ),
                      )
                  ],
                ),

              SizedBox(height: 20),
              Text('Sección de reacciones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              if(this.isReaction) DiferentReactions(),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10)
                  ),
                  onPressed: () => setState(() {
                    this.isReaction = !this.isReaction;
                  }), 
                  child: Row(
                    children: [
                      Image.asset('assets/like.png', height: 50, width: 50),
                      SizedBox(width: 15),
                      Text('Reaccionar', style: TextStyle(color: Colors.black))
                    ],
                  )
                ),
              ),
              SizedBox(height: 20),
              Text('Sección de Videos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              VideoSection()
            ] 
          ),
        ),
      ],
    );
  }
  void clearSelection() => setState(() {
    compressedVideoInfo = null;
    fileVideo = null;
  });

  Widget buildVideoCompressInfo() {
    if(compressedVideoInfo == null) return Container();
    final size = compressedVideoInfo!.filesize! / 1000;
    return Column(
      children: [
        Text('Info Video Comprimido', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Tamaño: $size KB', style: TextStyle(fontSize: 20)),
        SizedBox(height: 8),
        Text('${compressedVideoInfo!.path}', textAlign: TextAlign.center,)
      ],
    );
  }

  Future pickVideo() async {
    FilePickerResult? picker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
      allowMultiple: false
    );
    if(picker == null) return;
    final file = File(picker.files.first.path!);
    setState(() => fileVideo = file);
    generateThumbnail(fileVideo!);
    getVideoSize(fileVideo!);
  }

  Widget buildVideoInfo(){
    if (videoSize == null) return Container();
    final size = videoSize! / 1000;
    return Column(
      children: [
        Text('Original Video Info', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Tamaño: $size KB', style: TextStyle(fontSize: 20))
      ],
    );
  }

  Widget buildThumbnail() => thumbnailBytes == null
    ? CircularProgressIndicator()
    : Image.memory(thumbnailBytes!, height: 100);

  Future generateThumbnail(File file) async {
    final thumbnailBytes = await VideoCompress.getByteThumbnail(file.path);
    setState(() => this.thumbnailBytes = thumbnailBytes);
  }

  Future getVideoSize(File file) async {
    final size = await file.length();
    setState(() => this.videoSize = size);
  }

  Future compressVideo() async {
    if(fileVideo != null) {
      print('Pasando por file video');
      print(fileVideo);
      // final info = await VideoCompressApi.compressVideo(fileVideo!);
      //setState(() => compressedVideoInfo = info);
    }
  }
}
