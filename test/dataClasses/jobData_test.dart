
import 'package:flutter_test/flutter_test.dart';
import 'package:home_service_app/dataClasses/jobData.dart';

void main() {
  test('Test Job Data toMap', () {
    JobData data = JobData(
        jobID: "jobID",
        jobName: 'jobName',
        jobDescription: 'jobDescription',
        jobLocation: 'jobLocation',
        jobType: 'jobType',
        jobPrice: 'jobPrice',
        ActiveJobImages: ['ActiveJobImages'],
        CompletedJobImages: ['CompletedJobImages'],
        clientReview: 'clientReview',
        Latitude: 0.00,
        Longitude: 0.00,
        workerReview: 'workerReview', job_Requests: []);

    final map = data.toJson();

    expect(map['Job_ID'], 'jobID');
    expect(map['Title'], 'jobName');
    expect(map['Description'], 'jobDescription');
    expect(map['Address'], 'jobLocation');
    expect(map['Type'], 'jobType');
    expect(map['Latitude'], 0.00);
    expect(map['Longitude'], 0.00);
    expect(map['Price'], 'jobPrice');
    expect(map['Client_Review'], 'clientReview');
    expect(map['Worker_Review'], 'workerReview');
    expect(map['Active_Job_Images'], ['ActiveJobImages']);
    expect(map['Completed_Job_Images'], ['CompletedJobImages']);
    expect(map["isCompleted"], false);
    expect(map["isCompleted"], false);
    expect(map["isReviewed"], false);

    final dclass = JobData.fromJson(map);
    
    expect(dclass.ActiveJobImages,data.ActiveJobImages);
    expect(dclass.Latitude,data.Latitude);
    expect(dclass.Longitude,data.Longitude);
    expect(dclass.clientReview,data.clientReview);
    expect(dclass.isCompleted,data.isCompleted);
    expect(dclass.isReviewed,data.isReviewed);
    expect(dclass.jobDescription,data.jobDescription);
    expect(dclass.jobID,data.jobID);
    expect(dclass.jobLocation,data.jobLocation);
    expect(dclass.jobName,data.jobName);
    expect(dclass.jobPrice,data.jobPrice);
    expect(dclass.jobType,data.jobType);
    expect(dclass.workerReview,data.workerReview);

  });
}
