import 'dart:developer';
import 'dart:io';

import 'package:background_listen_sms/model/sms_data.dart';
import 'package:readsms/readsms.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;

import '../config/base_config.dart';
import '../main.dart';
import '../utils/constants.dart';

int idTask = 0;
Future<void> createBackgroundTask(SMS sms) async {
  await Workmanager().registerOneOffTask(
    idTask.toString(),
    sendSMSDataToServerTaskName,
    tag: "sms-$idTask",
    existingWorkPolicy: ExistingWorkPolicy.keep,
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresDeviceIdle: false,
      requiresStorageNotLow: false,
    ),
    backoffPolicy: BackoffPolicy.exponential,
    backoffPolicyDelay: Duration.zero,
    inputData: MySMS.fromSMS(sms).toMap(),
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    if (task == sendSMSDataToServerTaskName) {
      return sendSMSDataToServer(inputData!).then((value) => value);
    } else {
      // TODO: noti for server this app is close
      // https://pub.dev/packages/flutter_background_service
    }

    return Future.value(false);
  });
}

Future<bool> sendSMSDataToServer(Map<String, dynamic> inputData) async {
  try {
    final url = BaseConfig.ins.uri(inputData);
    final response = await http.get(url, headers: {"secure-token": "token"});
    if (response.statusCode == HttpStatus.ok) {
      return await _saveData(inputData, true);
    }

    final message = "status code error: ${response.statusCode}";
    return await _saveData(inputData, false, message);
  } catch (e) {
    log(e.toString(), name: "sendSMSDataToServer");
    return await _saveData(inputData, false, e.toString());
  }
}

Future<bool> _saveData(
  Map<String, dynamic> inputData,
  bool status, [
  String? error,
]) async {
  try {
    final MySMS mySMS = MySMS.fromMap(inputData);
    final SMSData smsData = SMSData(
      sms: mySMS,
      status: status,
      errorMsg: error,
    );

    await smsLocalDataSource.create(data: smsData);
    
    return true;
  } catch (e) {
    log(e.toString(), name: "_saveData");
    return false;
  }
}
