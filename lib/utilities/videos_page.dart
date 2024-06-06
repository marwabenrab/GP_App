import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatefulWidget {
  static const String screenRoute = 'videos_page';
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;
  bool isMute = false;

  @override
  void initState() {
    super.initState();
    controller1 = VideoPlayerController.asset("assets/ved.mp4")
      ..initialize().then((_) {
        setState(() {});
      });

    controller2 = VideoPlayerController.asset("assets/vd.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Videos',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          VideoWidget(controller: controller1),
          SizedBox(height: 30),
          VideoWidget(controller: controller2),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: isMute ? Icon(Icons.volume_off_rounded) : Icon(Icons.volume_up),
        onPressed: () {
          setState(() {
            controller1.setVolume(isMute ? 1 : 0);
            controller2.setVolume(isMute ? 1 : 0);
            isMute = !isMute;
          });
        },
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoWidget({super.key, required this.controller});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: widget.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                )
              : Container(),
        ),
        VideoProgressIndicator(widget.controller, allowScrubbing: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                Duration? value = await widget.controller.position;
                if (value != null) {
                  var d = value - Duration(seconds: 10);
                  widget.controller.seekTo(d);
                }
              },
              child: Text("<<"),
            ),
            ElevatedButton(
              onPressed: () {
                widget.controller.play();
              },
              child: Icon(Icons.play_arrow_rounded),
            ),
            ElevatedButton(
              onPressed: () {
                widget.controller.pause();
              },
              child: Icon(Icons.pause),
            ),
            ElevatedButton(
              onPressed: () async {
                Duration? value = await widget.controller.position;
                if (value != null) {
                  var d = value + Duration(seconds: 10);
                  widget.controller.seekTo(d);
                }
              },
              child: Text(">>"),
            ),
          ],
        ),
      ],
    );
  }
}
