import 'package:testflavor/app_environment.dart';
import 'main.dart' as runner;

void main() {
  var flavor = String.fromEnvironment('FLAVOR_NAME', defaultValue: Environment.PROD.name);
  AppEnvironment.getAndSetEnv(flavorName: flavor);
  runner.main();
}
