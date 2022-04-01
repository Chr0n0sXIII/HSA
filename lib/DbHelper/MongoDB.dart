import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constants.dart';

class MongoDb {
  static var db, userCollection, credCollection, jobCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    credCollection = db.collection(CREDENTIAL_COLLECTION);
    jobCollection = db.collection(JOBDATA_COLLECTION);
  }
}
