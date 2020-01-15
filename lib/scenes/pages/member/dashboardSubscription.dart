

abstract class dashboardSubscription  {
  Sink get inputText;
  Stream<bool> get OutputIsEnabled;
  Stream<String> get outputErrorText;

  void dispose();
}