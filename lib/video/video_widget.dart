import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoWidget extends StatefulWidget {
  bool? isFileVideo;
  VlcPlayerController controller;

  VideoWidget({Key? key, this.isFileVideo, required this.controller})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        child: buildVideo(),
      );

  Widget buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(child: basicOverlayWidget())
        ],
      );

  Widget buildVideoPlayer() => Container(
        height: 400,
        child: VlcPlayer(
          controller: widget.controller,
          aspectRatio: 16 / 9,
        ),
      );

  Widget basicOverlayWidget() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.controller.value.isPlaying
            ? widget.controller.pause()
            : widget.controller.play(),
        child: Stack(
          children: [
            buildPlay(),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator()),
          ],
        ),
      );
  Widget buildIndicator() =>
      // VlcProgressIndicator(widget.controller, allowScrubbing: true);
      Text('data');
  Widget buildPlay() => widget.controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        );
}
