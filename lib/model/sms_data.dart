import 'package:isar/isar.dart';
import 'package:readsms/readsms.dart';

import '../utils/constants.dart';

part 'sms_data.g.dart';

@collection
class SMSData {
  Id id = Isar.autoIncrement;
  bool status;
  MySMS? sms;
  String? errorMsg;

  SMSData({this.status = false, this.sms, this.errorMsg});
}

@embedded
class MySMS {
  String? body;
  String? sender;
  DateTime? timeReceived;
  MySMS({this.body, this.sender, this.timeReceived});

  factory MySMS.fromSMS(SMS sms) {
    return MySMS(
      body: sms.body,
      sender: sms.sender,
      timeReceived: sms.timeReceived,
    );
  }

  SMS toSMS() {
    return SMS(
      body: body ?? "---",
      sender: sender ?? "---",
      timeReceived: timeReceived ?? DateTime(1900),
    );
  }

  factory MySMS.fromMap(Map<String, dynamic> map) {
    return MySMS(
      body: map[ModelConstant.body],
      sender: map[ModelConstant.sender],
      timeReceived: DateTime.fromMillisecondsSinceEpoch(
        int.parse(map[ModelConstant.timeReceived] as String),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelConstant.body: body,
      ModelConstant.sender: sender,
      ModelConstant.timeReceived:
          timeReceived?.millisecondsSinceEpoch.toString(),
    };
  }
}
