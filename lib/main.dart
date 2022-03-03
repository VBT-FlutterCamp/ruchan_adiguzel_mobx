import 'features/core/theme.dart';

import 'features/characters/view/character_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.dark,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Characterview(),
    );
  }
}
