

import 'dart:async';

import 'package:adli_train/scenes/pages/member/dashboardSubscription.dart';

class dashboardSubscriptionImpl implements dashboardSubscription {

  var _mail = StreamController<String>.broadcast();

  @override
  // TODO: implement OutputIsEnabled
  Stream<bool> get OutputIsEnabled => _mail.stream
  .map((data) => !data.isEmpty);

  @override
  void dispose() => _mail.close();

  @override
  // TODO: implement inputText
  Sink get inputText => _mail;

  @override
  // TODO: implement outputErrorText
  Stream<String> get outputErrorText => OutputIsEnabled.map((isEnabled) => isEnabled ? "" : "Invalid Email");

}