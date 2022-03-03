import '../../../core/base_view_model.dart';
import '../model/character_model.dart';
import '../service/char_network_manager.dart';
import 'icharacter_view_model.dart';
import '../../core/app_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store, BaseViewModel {
  late ICharNetworkManager charNetworkManager;

  @observable
  List<CharacterModel?>? charModels;
  // CharacterModel? c_model;

  @observable
  PageState pageState = PageState.LOADING;

  @action
  Future<void> getChars() async {
    pageState = PageState.LOADING;
    charModels = await charNetworkManager.getCharacterList();
    if (charModels == null) {
      pageState = PageState.ERROR;
      return;
    }
    pageState = PageState.DONE;
  }

  @override
  void setContext(BuildContext context) {}
  @override
  void init() {
    charNetworkManager = CharacterService(networkManager);
    getChars();
  }
}
