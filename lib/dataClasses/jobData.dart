class JobData {
  String jobID;
  String jobName;
  String jobDescription;
  String jobLocation;
  String? jobType;
  double Latitude;
  double Longitude;
  String jobPrice;
  List<String> ActiveJobImages;
  List<String> CompletedJobImages;
  bool isCompleted;
  bool isReviewed;
  String clientReview;
  String workerReview;

  JobData({
    required this.jobID,
    required this.jobName,
    required this.jobDescription,
    required this.jobLocation,
    required this.jobType,
    required this.Latitude,
    required this.Longitude,
    required this.jobPrice,
    required this.ActiveJobImages,
    required this.CompletedJobImages,
    this.isCompleted = false,
    this.isReviewed = false,
    required this.clientReview,
    required this.workerReview
  });

  Map<String, dynamic> toJson() {
    return {
      'Job_ID': jobID,
      'Title': jobName,
      'Description': jobDescription,
      'Address': jobLocation,
      'Type': jobType,
      'Latitude': Latitude,
      'Longitude': Longitude,
      'Price': jobPrice,
      'Active_Job_Images': ActiveJobImages,
      'Completed_Job_Images': CompletedJobImages,
      'isCompleted': isCompleted,
      'isReviewed' : isReviewed,
      'Client_Review' : clientReview,
      'Worker_Review' : workerReview
    };
  }

  static JobData fromJson(Map<String, dynamic> json) {
    return JobData(
        jobID: json['Job_ID'],
        jobName: json['Title'],
        jobDescription: json['Description'],
        jobLocation: json['Address'],
        jobType: json['Type'],
        Latitude: json['Latitude'],
        Longitude: json['Longitude'],
        jobPrice: json['Price'],
        ActiveJobImages: json['Active_Job_Images'].cast<String>(),
        CompletedJobImages: json['Completed_Job_Images'].cast<String>(),
        isCompleted: json['isCompleted'],
        isReviewed: json['isReviewed'],
        clientReview: json['Client_Review'],
        workerReview: json['Worker_Review']
    );
  }
}
