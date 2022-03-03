import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  // final String _baseUrl = ;

  late BuildContext context;
  INetworkManager get networkManager => NetworkManager(
      options: BaseOptions(baseUrl: "https://breakingbadapi.com/api/"));
  void setContext(BuildContext context);
  void init();
}
