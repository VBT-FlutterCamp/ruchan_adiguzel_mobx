import 'dart:developer';

import '../view-model/character_view_model.dart';
import '../../core/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base_view.dart';

class Characterview extends StatelessWidget {
  const Characterview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CharacterViewModel>(
      viewModel: CharacterViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, CharacterViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(title: Text("Characters")),
          body: Observer(
            builder: (context) {
              switch (viewModel.pageState) {
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.DONE:
                  // return Center(
                  //   child: Text("${viewModel.c_model?.name}"),
                  // );
                  return ListView.builder(
                    itemCount: viewModel.charModels?.length,
                    itemBuilder: (context, index) {
                      log(index.toString());
                      return Center(
                        child: Card(
                          child: ListTile(
                              title: Text(viewModel.charModels?[index]?.name ??
                                  "null")),
                        ),
                      );
                    },
                  );
                case PageState.ERROR:
                  return Center(child: Text("ERROR"));
              }
            },
          ),
        );
      },
    );
  }
}
