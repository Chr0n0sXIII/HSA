import 'package:flutter_test/flutter_test.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:latlng/latlng.dart';

void main() {
   test('Test Job Data toMap', () {
    JobData data = JobData(
        jobID: "jobID",
        jobName: 'jobName',
        jobDescription: 'jobDescription',
        jobLocation: 'jobLocation',
        jobType: 'jobType',
        latLng: LatLng(0, 0),
        jobPrice: 'jobPrice',
        ActiveJobImages: ['ActiveJobImages'],
        CompletedJobImages: ['CompletedJobImages']);

    final map = data.toMap();

    expect(map['jobID'], 'jobID');
    expect(map['jobName'], 'jobName');
    expect(map['jobDescription'], 'jobDescription');
    expect(map['jobLocation'], 'jobLocation');
    expect(map['jobType'], 'jobType');
    expect(map['latLng'], '0.00.0');
    expect(map['jobPrice'], 'jobPrice');
    expect(map['ActiveJobImages'], ['ActiveJobImages']);
    expect(map['CompletedJobImages'], ['CompletedJobImages']);
  });
}