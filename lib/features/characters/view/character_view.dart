import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base_view.dart';
import '../../core/app_enums.dart';
import '../../widgets/card_header.dart';
import '../view-model/character_view_model.dart';

class Characterview extends StatelessWidget {
  Characterview({Key? key}) : super(key: key);

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
          body: Observer(
            builder: (context) {
              switch (viewModel.pageState) {
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.DONE:
                  return PageView.builder(
                    controller: viewModel.controller,
                    itemBuilder: (context, index) => CardHeader(
                      model: viewModel.charModels?[index],
                      currentIndex: index,
                      length: viewModel.charModels?.length ?? 5,
                    ),
                    itemCount: viewModel.charModels?.length,
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



//  return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: viewModel.charModels?.length,
//                     itemBuilder: (context, index) {
//                       log(index.toString());
//                       return CardHeader(model: viewModel.charModels?[index]);
//                     },
//                   );