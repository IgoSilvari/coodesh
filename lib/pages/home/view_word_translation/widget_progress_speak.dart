import 'package:coodesh/store/word_translaton/controller_progress_audio_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class WidgetProgressSpeak extends StatelessWidget {
  const WidgetProgressSpeak({
    required this.flutterTts,
    required this.word,
    Key? key,
  }) : super(key: key);

  final FlutterTts flutterTts;
  final String word;

  @override
  Widget build(BuildContext context) {
    final controllerProgress =
        Provider.of<ControllerProgressAudioStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 5, bottom: 30),
      child: Row(
        children: [
          IconButton.filled(
            color: Colors.red,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.white,
              ),
            ),
            onPressed: () async {
              if (controllerProgress.isPlay) {
                _speak(context);
              } else if (controllerProgress.isPause) {
                _pause(context);
              } else if (controllerProgress.isContinue) {}
            },
            icon: Observer(builder: (_) {
              return Icon(
                controllerProgress.isPause
                    ? Icons.pause
                    : Icons.play_arrow_outlined,
                size: 25,
              );
            }),
          ),
          Expanded(
            child: Observer(builder: (_) {
              return SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  value: controllerProgress.valueProgress,
                  backgroundColor: Colors.grey.shade400,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Future _speak(BuildContext context) async {
    final controllerProgress =
        Provider.of<ControllerProgressAudioStore>(context, listen: false);
    controllerProgress.changeProgressAudio(StateProgress.playing);
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(word);
  }

  Future _pause(BuildContext context) async {
    final controllerProgress =
        Provider.of<ControllerProgressAudioStore>(context, listen: false);
    var result = await flutterTts.pause();
    if (result == 1) {
      controllerProgress.changeProgressAudio(StateProgress.paused);
    }
  }
}
