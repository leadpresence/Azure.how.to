import 'dart:developer';

import 'package:azurehowto/app/models.dart/videos-model.dart';
import 'package:azurehowto/app/utils/AHTColor.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleVideoPage extends StatefulWidget {
  final VideosModel videodata;
  SingleVideoPage({Key key, this.videodata}) : super(key: key);

  @override
  _SingleVideoPageState createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    print(widget.videodata.toString());

    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videodata.url,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AHTColors.primaryColor,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
      
          ],
     
        ),
        builder: (context, player) => Scaffold(
            key: _scaffoldKey,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: AHTColors.primaryColor,
                elevation: 0,
                brightness: Brightness.light,
                centerTitle: true,
                actions: [
                  IconButton(
                      icon: const Icon(Icons.video_library),
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: null)))
                ],
                expandedHeight: 200,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    widget.videodata.title,
                    style: TextStyle(color: AHTColors.primaryColor3,fontSize: 16,),
                    overflow: TextOverflow.ellipsis,maxLines: 4,
                  ),
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(90),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                "https://image.freepik.com/free-vector/cloud-computing-polygonal-wireframe-technology-concept_1017-29594.jpg",
                                scale: 3))),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    player,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _space,
                          _text('Description \n', widget.videodata.desc),
                          _space,
                          // _text('Channel', _videoMetaData.author),
                          _space,
                          // _text('Video Id', _videoMetaData.videoId),
                          // _space,
                          // Row(
                          //   children: [
                          //     _text(
                          //       'Playback Quality',
                          //       _controller.value.playbackQuality,
                          //     ),
                          //     const Spacer(),
                          //     _text(
                          //       'Playback Rate',
                          //       '${_controller.value.playbackRate}x  ',
                          //     ),
                          //   ],
                          // ),
                          _space,
                          // TextField(
                          //   enabled: _isPlayerReady,
                          //   controller: _idController,
                          //   decoration: InputDecoration(
                          //     border: InputBorder.none,
                          //     hintText:
                          //         'Enter youtube \<video id\> or \<link\>',
                          //     fillColor: AHTColors.primaryColor.withAlpha(20),
                          //     filled: true,
                          //     hintStyle: const TextStyle(
                          //       fontWeight: FontWeight.w300,
                          //       color: Colors.black38,
                          //     ),
                          //     suffixIcon: IconButton(
                          //       icon: const Icon(Icons.clear),
                          //       onPressed: () => _idController.clear(),
                          //     ),
                          //   ),
                          // ),
                          _space,
                          // Row(
                          //   children: [
                          //     _loadCueButton('LOAD'),
                          //     const SizedBox(width: 10.0),
                          //     _loadCueButton('CUE'),
                          //   ],
                          // ),
                          _space,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.skip_previous),
                                onPressed: _isPlayerReady
                                    ? () => _controller.load(_ids[(_ids.indexOf(
                                                _controller.metadata.videoId) -
                                            1) %
                                        _ids.length])
                                    : null,
                              ),
                              IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                                onPressed: _isPlayerReady
                                    ? () {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();

                                        BotToast.showText(
                                            text: _playerState.toString());

                                        setState(() {});
                                      }
                                    : null,
                              ),
                              IconButton(
                                icon: Icon(_muted
                                    ? Icons.volume_off
                                    : Icons.volume_up),
                                onPressed: _isPlayerReady
                                    ? () {
                                        _muted
                                            ? _controller.unMute()
                                            : _controller.mute();
                                        setState(() {
                                          _muted = !_muted;
                                        });
                                      }
                                    : null,
                              ),
                              FullScreenButton(
                                controller: _controller,
                                color: Colors.blueAccent,
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_next),
                                onPressed: _isPlayerReady
                                    ? () => _controller.load(_ids[(_ids.indexOf(
                                                _controller.metadata.videoId) +
                                            1) %
                                        _ids.length])
                                    : null,
                              ),
                            ],
                          ),
                          _space,
                          Row(
                            children: <Widget>[
                              const Text(
                                "Volume",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Expanded(
                                child: Slider(
                                  inactiveColor: Colors.transparent,
                                  value: _volume,
                                  min: 0.0,
                                  max: 100.0,
                                  divisions: 10,
                                  label: '${(_volume).round()}',
                                  onChanged: _isPlayerReady
                                      ? (value) {
                                          setState(() {
                                            _volume = value;
                                          });
                                          _controller
                                              .setVolume(_volume.round());
                                        }
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          _space,

                          //Show the Ply state of the video
                          // AnimatedContainer(
                          //   duration: const Duration(milliseconds: 800),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20.0),
                          //     color: _getStateColor(_playerState),
                          //   ),
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     _playerState.toString(),
                          //     style: const TextStyle(
                          //       fontWeight: FontWeight.w300,
                          //       color: Colors.white,
                          //     ),
                          //     textAlign: TextAlign.center,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }

  Widget _text(String title, String value) {
    return RichText(
                maxLines: 8,
                overflow: TextOverflow.ellipsis,

      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
            
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                    _idController.text,
                  );
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
