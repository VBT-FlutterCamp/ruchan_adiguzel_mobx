import 'dart:developer';

import 'package:vexana/vexana.dart';

import '../model/character_model.dart';

abstract class ICharNetworkManager {
  final INetworkManager networkManager;

  ICharNetworkManager(this.networkManager);

  Future<List<CharacterModel>?> getCharacterList();
}

class CharacterService extends ICharNetworkManager {
  CharacterService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<CharacterModel>?> getCharacterList() async {
    final response = await networkManager
        .send<CharacterModel, List<CharacterModel>>("characters",
            parseModel: CharacterModel(), method: RequestType.GET);
    if (response.data == null) {
      log("response data is null");
    } else {
      return response.data;
    }
    return null;
  }
}
