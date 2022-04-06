class userCredentials {
  String uName;
  String Password;

  userCredentials({
    required this.uName,
    required this.Password,
  });

  Map<String, dynamic> toMap() {
    return {'uName': uName, 'Password': Password};
  }
}
