import 'package:background_listen_sms/model/sms_data.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../model/auth.dart';
import '../model/sms_listdata.dart';
import '../main.dart';

class AuthProvider extends ChangeNotifier {
  bool get isAuth => currentAuth != null;

  Auth? _currentAuth;
  Auth? get currentAuth => _currentAuth;

  final BehaviorSubject<SMSListdata> smsListData =
      BehaviorSubject<SMSListdata>();

  final smsDatas = BehaviorSubject<List<SMSData>>();

  Future getSMSDatas() async {
    final smsLocal = await smsLocalDataSource.getAll();
    smsDatas.sink.add(smsLocal);
    notifyListeners();
  }

  login(String username, String password) {
    //   try {
    //   final url = BaseConfig.ins.uri(smsData);
    //   final response = await http.get(url, headers: {"secure-token": "token"});
    //   if (response.statusCode == HttpStatus.ok) {
    //     return true;
    //   }
    //   return false;
    // } catch (e) {
    //   print(e.toString());
    //   return false;
    // }
  }
}
