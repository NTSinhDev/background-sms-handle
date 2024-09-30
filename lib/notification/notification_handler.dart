// // this will be used as notification channel id
// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // this will be used for notification id, So you can update your custom notification with this id.
// const notificationId = 888;
// // Future<void> initializeService() async {
// //   final service = FlutterBackgroundService();

// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   await flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(channel);

// //   // await service.configure(
// //   //   androidConfiguration: AndroidConfiguration(
// //   //     // this will be executed when app is in foreground or background in separated isolate
// //   //     onStart: onStart,

// //   //     // auto start service
// //   //     autoStart: true,
// //   //     isForegroundMode: true,

// //   //     notificationChannelId: notificationChannelId, // this must match with notification channel you created above.
// //   //     initialNotificationTitle: 'AWESOME SERVICE',
// //   //     initialNotificationContent: 'Initializing',
// //   //     foregroundServiceNotificationId: notificationId,
// //   //   ),
// // }

// void startBackgroundService() {
//   final service = FlutterBackgroundService();
//   service.startService();
// }

// void stopBackgroundService() {
//   final service = FlutterBackgroundService();
//   service.invoke("stop");
// }

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//       onForeground: onStart,
//       onBackground: (service) => true,
//     ),
//     androidConfiguration: AndroidConfiguration(
//       autoStart: true,
//       onStart: onStart,
//       isForegroundMode: false,
//       autoStartOnBoot: true,
//     ),
//   );
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   final socket = io.io("your-server-url", <String, dynamic>{
//     'transports': ['websocket'],
//     'autoConnect': true,
//   });
//   socket.onConnect((_) {
//     print('Connected. Socket ID: ${socket.id}');
//     // Implement your socket logic here
//     // For example, you can listen for events or send data
//   });

//   socket.onDisconnect((_) {
//     print('Disconnected');
//   });
//   socket.on("event-name", (data) {
//     //do something here like pushing a notification
//   });
//   service.on("stop").listen((event) {
//     service.stopSelf();
//     print("background process is now stopped");
//   });

//   service.on("start").listen((event) {});

//   Timer.periodic(const Duration(seconds: 1), (timer) {
//     socket.emit("event-name", "your-message");
//     print("service is successfully running ${DateTime.now().second}");
//   });
// }

// Future<void> onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // bring to foreground
//   Timer.periodic(const Duration(seconds: 1), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         flutterLocalNotificationsPlugin.show(
//           notificationId,
//           'COOL SERVICE',
//           'Awesome ${DateTime.now()}',
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               ongoing: true,
//             ),
//           ),
//         );
//       }
//     }
//   });
// }

// const _androidInitializationSettings = AndroidInitializationSettings(
//   NotificationsConstantData.defaultIcon,
// );
// const _iosInitializationSettings = DarwinInitializationSettings(
//   requestAlertPermission: false,
//   requestBadgePermission: false,
//   requestSoundPermission: false,
// );
// const initializationSettings = InitializationSettings(
//   android: _androidInitializationSettings,
//   iOS: _iosInitializationSettings,
// );

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   NotificationsConstantData.channelId,
//   NotificationsConstantData.channelName,
//   description: NotificationsConstantData.channelDescription,
//   importance: Importance.max,
// );

// class NotificationsConstantData {
//   static const String defaultIcon = '@mipmap/ic_launcher';
//   static const String skyIcon = defaultIcon;
//   static const String channelId = 'com.example.background_listen_sms';
//   static const String channelName = 'background_listen_sms';
//   static const String channelDescription = "admin Channel Notification";
//   static const String sound = 'default.wav';
// }
