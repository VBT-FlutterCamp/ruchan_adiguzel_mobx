import 'package:b_bad/features/characters/model/character_model.dart';
import 'package:b_bad/features/core/app_enums.dart';
import 'package:mobx/mobx.dart';
part 'i_char_view_model.g.dart';

class ICharacterViewModel = _ICharacterViewModelBase with _$ICharacterViewModel;

abstract class _ICharacterViewModelBase with Store {
  @observable
  List<CharacterModel> charModels = [];

  PageState pageState = PageState.WAITING;
}
//TODO NETWORK GONNA IMPLEMENTS