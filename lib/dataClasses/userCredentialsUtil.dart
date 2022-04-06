import 'package:home_service_app/dataClasses/userCredentials.dart';

class userCredentialUtil {
  static List<userCredentials> TestData_UserCredentials() {
    return [
      userCredentials(uName: "AlexM@gmail.com", Password: "Alex1"),
      userCredentials(uName: "BobbyBoi@gmail.com", Password: "Bobby1"),
    ];
  }
}
