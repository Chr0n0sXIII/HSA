class User {
  static String uName = "Jiles Ramjattan";
  static String email = "jilesramjattan@gmail.com";
  static String about = "Na";
  static String contacts = "Na";
  static String skills = "";
  static List<String> activeRequests = [""];
  static String activeJob = "";
  static double clientRating = 0;
  static double workerRating = 0;

  static String pfp = "";

  static setUname(String uName) {
    User.uName = uName;
  }

  static setemail(String email) {
    User.email = email;
  }

  static setabout(String about) {
    User.about = about;
  }

  static setcontacts(String contacts) {
    User.contacts = contacts;
  }

  static setskills(String skills) {
    User.skills = skills;
  }

  static setactiveRequest(List<String> Requests) {
    User.activeRequests = Requests;
  }

  static setactiveJob(String job) {
    User.activeJob = job;
  }

  static setclientRating(var clientRating) {
    User.clientRating = clientRating;
  }

  static setworkerRating(var workerRating) {
    User.workerRating = workerRating;
  }

  static setpfp(String pfp) {
    User.pfp = pfp;
  }
}
