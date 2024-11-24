import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class reelItems extends StatefulWidget {
  final String? urlVideo;
  final String? thumbnailUrl;
  reelItems({super.key, this.urlVideo, this.thumbnailUrl});

  @override
  State<reelItems> createState() => _reelItemsState();
}

class _reelItemsState extends State<reelItems> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  bool isVideoLoaded = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        //VideoPlayerController.asset('assets/videos/videos1.mp4')
        VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo.toString()))
          ..initialize().then((_) {
            setState(() {
              isVideoLoaded = true;
            });
            videoPlayerController.play();
          });
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 9 / 16,
        autoPlay: true,
        looping: true);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return /*Container(
      color: colors.greyColor,
      child: Center(
        child: videoPlayerController.value.isInitialized
            ? Chewie(controller: chewieController!)
            : const CircularProgressIndicator(),
      ),
    );*/
    
    Container(
      color: colors.greyColor,
      child: Center(
        child: Stack(
          children: [
            if (!isVideoLoaded)
              Image.network(
                widget.thumbnailUrl.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              )
            else
              Chewie(controller: chewieController!),
            if (isVideoLoaded)
              Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 60,
                  color: colors.whiteColor.withOpacity(0.7),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
