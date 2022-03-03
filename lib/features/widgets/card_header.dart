import 'package:flutter/material.dart';

import '../characters/model/character_model.dart';

class CardHeader extends StatelessWidget {
  CardHeader(
      {Key? key,
      required this.model,
      required this.currentIndex,
      required this.length})
      : super(key: key);
  final int length;
  final int currentIndex;
  final whiteText = TextStyle(color: Colors.white);
  String giveAllItems<T>(List<T>? list) {
    String temp = "";
    if (list != null) {
      for (var item in list) {
        temp += item.toString() + ",";
      }
    }
    return temp;
  }

  final CharacterModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: nickNameText(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardImageItem(context),
            ],
          ),
          realNameText(context),
          subtitleText(context),
          Text(
            "Seasons: ${giveAllItems<int>(model?.appearance)}",
            style: whiteText,
          ),
          Text(
            "Occuption: ${giveAllItems<String>(model?.occupation)}",
            style: whiteText,
            maxLines: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "${currentIndex + 1}/${length}",
            style: whiteText,
          )
        ],
      ),
    );
  }

  Text nickNameText() {
    return Text(
      model?.nickname ?? "null nickname ",
      style: TextStyle(fontWeight: FontWeight.w300),
    );
  }

  Widget realNameText(BuildContext context) {
    return Text(
      model?.name ?? "null name",
      style: Theme.of(context)
          .textTheme
          .displayMedium
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w200),
      textAlign: TextAlign.center,
    );
  }

  Text subtitleText(BuildContext context) {
    return Text(
      "${model?.portrayed} ${model?.birthday == "Unknown" ? " " : ",Birthday= ${model?.birthday}"}",
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Colors.white70),
    );
  }

  SizedBox CardImageItem(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          buildImage(),
          build_gradient(),
          buildText(context),
        ],
      ),
    );
  }

  Container buildText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        model?.nickname ?? "null",
        style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w200),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        model?.img ?? "",
        width: 300,
        loadingBuilder: (context, child, event) {
          if (event == null) return child;
          return Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: const Color(0xff369457),
                backgroundColor: Colors.white70,
                value: event.expectedTotalBytes != null
                    ? event.cumulativeBytesLoaded / event.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget build_gradient() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.1,
                  0.5,
                ])),
      ),
    );
  }
}
