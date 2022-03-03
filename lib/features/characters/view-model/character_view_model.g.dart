// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterViewModel on _CharacterViewModelBase, Store {
  final _$charModelsAtom = Atom(name: '_CharacterViewModelBase.charModels');

  @override
  List<CharacterModel?>? get charModels {
    _$charModelsAtom.reportRead();
    return super.charModels;
  }

  @override
  set charModels(List<CharacterModel?>? value) {
    _$charModelsAtom.reportWrite(value, super.charModels, () {
      super.charModels = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_CharacterViewModelBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$getCharsAsyncAction = AsyncAction('_CharacterViewModelBase.getChars');

  @override
  Future<void> getChars() {
    return _$getCharsAsyncAction.run(() => super.getChars());
  }

  @override
  String toString() {
    return '''
charModels: ${charModels},
pageState: ${pageState}
    ''';
  }
}
