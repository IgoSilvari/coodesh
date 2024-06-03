import 'package:mobx/mobx.dart';
part 'controller_progress_audio_store.g.dart';

class ControllerProgressAudioStore = ControllerProgressAudioStoreBase
    with _$ControllerProgressAudioStore;

abstract class ControllerProgressAudioStoreBase with Store {
  @observable
  String textTranslation = '';

  @action
  void changeText(String value) => textTranslation = value;

  @computed
  int get lengText => textTranslation.length;

  @observable
  int endOffset = 0;

  @action
  void changeEndOffset(int value) => endOffset = value;

  @action
  void cleanData() {
    endOffset = 0;
  }

  @computed
  double get valueProgress => endOffset / lengText;

  @observable
  bool isPlay = true;

  @observable
  bool isPause = false;

  @observable
  bool isContinue = false;

  @action
  void changeProgressAudio(StateProgress state) {
    switch (state) {
      case StateProgress.paused:
        isPause = false;
        isPlay = true;
        break;
      case StateProgress.playing:
        isPlay = false;
        isPause = true;
        break;
      default:
    }
  }
}

enum StateProgress { playing, stopped, paused, continued }
