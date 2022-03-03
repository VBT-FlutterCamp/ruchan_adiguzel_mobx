import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends INetworkModel {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;

  CharacterModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CharacterModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }
}
