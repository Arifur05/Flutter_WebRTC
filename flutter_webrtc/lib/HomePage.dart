
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Flutter Explained - WebRTC"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //signaling.openUserMedia(_localRenderer, _remoteRenderer);
                  },
                  child: const Text("Open camera & microphone"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //roomId = await signaling.createRoom(_remoteRenderer);
                    textEditingController.text = roomId!;
                    setState(() {});
                  },
                  child: const Text("Create room"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add roomId
                    // signaling.joinRoom(
                    //   textEditingController.text,
                    //   _remoteRenderer,
                    // );
                  },
                  child: const Text("Join room"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // signaling.hangUp(_localRenderer);
                  },
                  child: const Text("Hangup"),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}

