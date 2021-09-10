/*
 * @Author: your name
 * @Date: 2021-09-10 15:21:09
 * @LastEditTime: 2021-09-10 15:21:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_flutter/lib/video.dart
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video Player Demo',
      home: MediaPage(),
    );
  }
}

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  bool get _isFullScreen =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: Container(
        child: MyVideo(
          url:
              'http://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4',
          title: '示例视频',
          // 这个vw是MediaQueryData.fromWindow(window).size.width屏幕宽度
          // width: _isFullScreen? vh : vw,
          // height: _isFullScreen? vw : vw/16*9, // 竖屏时容器为16：9
        ),
      ),
    );
  }
}

class MyVideo extends StatefulWidget {
  MyVideo({
    required this.url,
    // @required this.width,
    // @
    this.title = '',
  });

  final String url;
  final String title;

  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  // 指示video资源是否加载完成，加载完成后会获得总时长和视频长宽比等信息
  bool _videoInit = false;
  // video控件管理器
  late VideoPlayerController _controller;
  // 记录video播放进度
  Duration _position = Duration(seconds: 0);

  // 记录播放控件ui是否显示(进度条，播放按钮，全屏按钮等等)
  // 计时器，用于延迟隐藏控件ui
  late Timer _timer;
  // 控制是否隐藏控件ui
  late bool _hidePlayControl = true;
  // 通过透明度动画显示/隐藏控件ui
  double _playControlOpacity = 0.0;
  // // 记录是否全屏
  bool get _isFullScreen =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      // height: widget.height,
      color: Colors.black,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _togglePlayControl();
            },
            child: _videoInit
                ? Center(
                    child: AspectRatio(
                      // 加载url成功时，根据视频比例渲染播放器
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      // 没加载完成时显示转圈圈loading
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
          // _bottomControl, // 控件ui下半部
          Positioned(
            left: 0,
            bottom: 0,
            child: Offstage(
              offstage: _hidePlayControl,
              child: AnimatedOpacity(
                opacity: _playControlOpacity,
                duration: Duration(milliseconds: 300),
                child: Container(
                  // width: widget.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, .7), Color.fromRGBO(0, 0, 0, .1)],
                    )
                  ),
                  child: _videoInit?Row( // 加载完成时才渲染,flex布局
                    children: [
                      IconButton( // 播放按钮
                        padding: EdgeInsets.zero,
                        iconSize: 26,
                        icon: Icon( // 根据控制器动态变化播放图标还是暂停
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          setState(() { // 同样的，点击动态播放或者暂停
                            _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                              _startPlayControlTimer(); // 操作控件后，重置延迟隐藏控件的timer
                          });
                        },
                      ),
                      // Flexible( // 相当于前端的flex: 1
                      //   child: VideoProgressIndicator( // 嘻嘻，这是video_player编写好的进度条，直接用就是了~~
                      //     _controller,
                      //     allowScrubbing: true, // 允许手势操作进度条
                      //     padding: EdgeInsets.all(0),
                      //     colors: VideoProgressColors( // 配置进度条颜色，也是video_player现成的，直接用
                      //       playedColor: Theme.of(context).primaryColor, // 已播放的颜色
                      //       bufferedColor: Color.fromRGBO(255, 255, 255, .5), // 缓存中的颜色
                      //       backgroundColor: Color.fromRGBO(255, 255, 255, .2), // 为缓存的颜色
                      //     ),
                      //   ),
                      // ),
                      // Container( // 播放时间
                      //   margin: EdgeInsets.only(left: 10),
                      //   child: Text( // durationToTime是通过Duration转成hh:mm:ss的格式，自己实现。
                      //     durationToTime(_position)+'/'+durationToTime(_controller.value.duration),
                      //     style: TextStyle(
                      //       color: Colors.white
                      //     ),
                      //   ),
                      // ),
                    ],
                    ):Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _urlChange(); // 初始化进行一次url加载
    super.initState();
  }

  @override
  void didUpdateWidget(MyVideo oldWidget) {
    if (oldWidget.url != widget.url) {
      _urlChange();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // _controller.removeListener(_videoListener);
    _controller.dispose();

    super.dispose();
  }

  void _urlChange() {
    if (widget.url == '') return;
    // _controller.removeListener(_videoListener);
    // _controller.dispose();

    setState(() {
      // _hidePlayControl = true;
      _videoInit = false;
      // _position = Duration(seconds: 0);
    });

    // 加载network的url
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // 加载资源完成时，监听播放进度，并且标记_videoInit=true加载完成
        // _controller.addListener(_videoListener);
        setState(() {
          _videoInit = true;
        });
      });
  }

  // void _videoListener() async {
  //   Duration? res = await _controller.position;
  //   if (res! >= _controller.value.duration) {
  //     _controller.pause();
  //     _controller.seekTo(Duration(seconds: 0));
  //   }

  //   setState(() {
  //     // _position = res;
  //   });
  // }

  // void _togglePlayControl() {
  //   setState(() {
  //     if (_controller.value.isPlaying) {
  //       _controller.pause();
  //     } else {
  //       _controller.play();
  //     }
  //   });
  // }

  void _togglePlayControl() {
    setState(() {
      if (_hidePlayControl) {
        // 如果隐藏则显示
        _hidePlayControl = false;
        _playControlOpacity = 1;
        _startPlayControlTimer(); // 开始计时器，计时后隐藏
      } else {
        // 如果显示就隐藏
        // if (_timer != null) _timer.cancel(); // 有计时器先移除计时器
        _playControlOpacity = 0;
        Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
          _hidePlayControl = true; // 延迟300ms(透明度动画结束)后，隐藏
        });
      }
    });
  }

  void _startPlayControlTimer() {
    // 计时器，用法和前端js的大同小异
    // if (_timer != null) _timer.cancel();
    _timer = Timer(Duration(seconds: 3), () {
      // 延迟3s后隐藏
      setState(() {
        _playControlOpacity = 0;
        Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
          _hidePlayControl = true;
        });
      });
    });
  }

  // Widget _bottomControl = Positioned(
  //   // 需要定位
  //   left: 0,
  //   bottom: 0,
  //   child: Offstage(
  //     // 控制是否隐藏
  //     offstage: _hidePlayControl,
  //     child: AnimatedOpacity(
  //       // 加入透明度动画
  //       opacity: _playControlOpacity,
  //       duration: Duration(milliseconds: 300),
  //       child: Container(
  //         // 底部控件的容器
  //         // width: widget.width,
  //         height: 40,
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             // 来点黑色到透明的渐变优雅一下
  //             begin: Alignment.bottomCenter,
  //             end: Alignment.topCenter,
  //             colors: [
  //               Color.fromRGBO(0, 0, 0, .7),
  //               Color.fromRGBO(0, 0, 0, .1)
  //             ],
  //           ),
  //         ),
  //         child: _videoInit
  //             ? Row(
  //                 // 加载完成时才渲染,flex布局
  //                 children: <Widget>[
  //                   IconButton(
  //                     // 播放按钮
  //                     padding: EdgeInsets.zero,
  //                     iconSize: 26,
  //                     icon: Icon(
  //                       // 根据控制器动态变化播放图标还是暂停
  //                       _controller.value.isPlaying
  //                           ? Icons.pause
  //                           : Icons.play_arrow,
  //                       color: Colors.white,
  //                     ),
  //                     onPressed: () {
  //                       setState(() {
  //                         // 同样的，点击动态播放或者暂停
  //                         _controller.value.isPlaying
  //                             ? _controller.pause()
  //                             : _controller.play();
  //                         _startPlayControlTimer(); // 操作控件后，重置延迟隐藏控件的timer
  //                       });
  //                     },
  //                   ),
  //                   Flexible(
  //                     // 相当于前端的flex: 1
  //                     child: VideoProgressIndicator(
  //                       // 嘻嘻，这是video_player编写好的进度条，直接用就是了~~
  //                       _controller,
  //                       allowScrubbing: true, // 允许手势操作进度条
  //                       padding: EdgeInsets.all(0),
  //                       colors: VideoProgressColors(
  //                         // 配置进度条颜色，也是video_player现成的，直接用
  //                         playedColor: Theme.of(context).primaryColor, // 已播放的颜色
  //                         bufferedColor:
  //                             Color.fromRGBO(255, 255, 255, .5), // 缓存中的颜色
  //                         backgroundColor:
  //                             Color.fromRGBO(255, 255, 255, .2), // 为缓存的颜色
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     // 播放时间
  //                     margin: EdgeInsets.only(left: 10),
  //                     child: Text(
  //                       // durationToTime是通过Duration转成hh:mm:ss的格式，自己实现。
  //                       durationToTime(_position) +
  //                           '/' +
  //                           durationToTime(_controller.value.duration),
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             : Container(),
  //       ),
  //     ),
  //   ),
  // );
}
