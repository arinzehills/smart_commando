import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:smart_commando/components/gradient_text.dart';
import 'package:smart_commando/constants/constant.dart';

class NetworkPlayerWidget extends StatefulWidget {
  final String videoName;
  final String videoUrl;
  final bool? showVideoName;
  final bool? autoPlay;
  final VoidCallback onShowCamera;

  NetworkPlayerWidget(
      {Key? key,
      required this.videoName,
      this.showVideoName,
      this.autoPlay,
      required this.onShowCamera,
      required this.videoUrl})
      : super(key: key);

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  late VlcPlayerController controller;
  bool loading = false;
  Future<void> initializePlayer() async {}
  @override
  void initState() {
    super.initState();

    controller = VlcPlayerController.network(
      widget.videoUrl,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    )..addListener(() => setState(() {
          loading = controller.value.isInitialized;
        }));
  }

  @override
  void dispose() async {
    super.dispose();
    await controller.dispose();
    // await controller.stopRendererScanning();
  }

  Widget buildVideo(loading) => Stack(
        children: [
          if (!loading)
            Center(
                child: GradientText(
              'Loading...',
              style: TextStyle(fontSize: 33),
              gradient: LinearGradient(colors: myPinkGradient),
            )),
          Container(
            alignment: Alignment.topCenter,
            child: buildVideoPlayer(),
          ),
        ],
      );
  Widget buildVideoPlayer() => Container(
        height: 400,
        child: VlcPlayer(
          controller: controller,
          aspectRatio: 16 / 9,
        ),
      );
  Widget basicOverlayWidget() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                color: Colors.black26,
                child: Center(child: Text('Loading..'))),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    print('controller.value.url');
    print(widget.videoUrl);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          // VideoWidget(
          //   controller: controller,
          // ),

          Container(
            height: 250,
            width: size(context).width * 0.9,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                IconButton(
                    onPressed: widget.onShowCamera, icon: Icon(Icons.cancel)),
                buildVideo(loading),
              ],
            ),
            decoration: myBoxDecoration(),
          )
        ],
      ),
    );
  }
}
