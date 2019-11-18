import 'package:flutter/material.dart';
import 'package:judouapp/utils/AdaptDevice.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
// import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key key, @required this.url}) : super(key: key);

  final String url;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放视频'),
      ),
      body: Container(
        width: AdaptDevice.screenW(),
        height: AdaptDevice.screenH(),
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
