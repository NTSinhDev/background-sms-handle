import 'dart:developer';

import 'package:background_listen_sms/model/sms_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';
import 'package:readsms/readsms.dart';

import 'background_handler/background_handler.dart';
import 'local_datasources/local_datasources.dart';
import 'views/dash_board_screen.dart';
import 'provider/auth_provider.dart';

LocalDataSource<SMSData> smsLocalDataSource = SMSLocalDataSource();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  await smsLocalDataSource.openIsarInstance();
  await Workmanager().cancelAll();
  runApp(const MyApp());
}

bool protocolHttp = true;
String endPoint = "/api/v1/casso/mobile/callback";
String baseURL = "192.168.31.51:3300";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _plugin = Readsms();
  late AuthProvider _authProvider;

  @override
  void initState() {
    _getPermission().then((granted) {
      if (granted) {
        _plugin.read();
        _plugin.smsStream.listen((SMS sms) {
          idTask++;

          _createTaskForWorkmanager(sms);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Support Dev SMS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, authService, child) {
            // if (authService.isAuth) {
            _authProvider = authService;
            authService.getSMSDatas();
            return const DashboardScreen(title: 'Support Dev SMS');
            // }

            // return const LoginScreen();
          },
        ),
      ),
    );
  }

  _createTaskForWorkmanager(SMS sms) {
    createBackgroundTask(sms).then(
      (value) {
        _authProvider.getSMSDatas();
      },
    );
  }

  Future<bool> _getPermission() async {
    if (await permission_handler.Permission.sms.status ==
        permission_handler.PermissionStatus.granted) {
      return true;
    } else {
      if (await permission_handler.Permission.sms.request() ==
          permission_handler.PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
