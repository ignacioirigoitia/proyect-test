import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoSection extends StatefulWidget {
  const VideoSection({ Key? key }) : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {

  late VideoPlayerController _controllerCDN;
  late VideoPlayerController _controllerFirstOption;
  late VideoPlayerController _controllerSecondOption;
  Future<void>? _initializeVideoPlayerFutureCDN;
  Future<void>? _initializeVideoPlayerFutureFirstOption;
  Future<void>? _initializeVideoPlayerFutureSecondOption;

  @override
  void initState() {
    _controllerCDN = VideoPlayerController.network(
        'https://cdn.globalrmm.online/Nature%20-%2031377-reducido%20youtube.mp4');
    _initializeVideoPlayerFutureCDN = _controllerCDN.initialize();
    _controllerCDN.setLooping(true);
    _controllerCDN.setVolume(1.0);

    _controllerFirstOption = VideoPlayerController.network(
        'https://cdn.globalrmm.online/Nature%20-%2031377-reducido%20youtube.mp4');
    _initializeVideoPlayerFutureFirstOption = _controllerFirstOption.initialize();
    _controllerFirstOption.setLooping(true);
    _controllerFirstOption.setVolume(1.0);

    _controllerSecondOption = VideoPlayerController.network(
        'https://cdn.globalrmm.online/Nature%20-%2031377-reducido%20youtube.mp4');
    _initializeVideoPlayerFutureSecondOption = _controllerSecondOption.initialize();
    _controllerSecondOption.setLooping(true);
    _controllerSecondOption.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controllerCDN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFutureCDN,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(_controllerCDN.value.isPlaying){
                            _controllerCDN.pause();
                          }else{
                            _controllerCDN.play();
                          }
                        });
                      }, 
                      child: Text(_controllerCDN.value.isPlaying ? 'Pausar CDN' : 'Reproducir CDN')
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: _controllerCDN.value.aspectRatio,
                          child: VideoPlayer(_controllerCDN),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue,
                ),
              );
            }
          }
        ),
        FutureBuilder(
          future: _initializeVideoPlayerFutureFirstOption,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(_controllerFirstOption.value.isPlaying){
                            _controllerFirstOption.pause();
                          }else{
                            _controllerFirstOption.play();
                          }
                        });
                      }, 
                      child: Text(_controllerFirstOption.value.isPlaying ? 'Pausar First' : 'Reproducir First')
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: _controllerFirstOption.value.aspectRatio,
                          child: VideoPlayer(_controllerFirstOption),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue,
                ),
              );
            }
          }
        ),
        FutureBuilder(
          future: _initializeVideoPlayerFutureSecondOption,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(_controllerSecondOption.value.isPlaying){
                            _controllerSecondOption.pause();
                          }else{
                            _controllerSecondOption.play();
                          }
                        });
                      }, 
                      child: Text(_controllerSecondOption.value.isPlaying ? 'Pausar Second' : 'Reproducir Second')
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: _controllerSecondOption.value.aspectRatio,
                          child: VideoPlayer(_controllerSecondOption),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue,
                ),
              );
            }
          }
        ),
      ],
    );
  }
}