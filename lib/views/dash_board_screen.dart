import 'package:background_listen_sms/model/sms_data.dart';
import 'package:background_listen_sms/provider/auth_provider.dart';
import 'package:background_listen_sms/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../background_handler/background_handler.dart';
import '../utils/custom_rich_text.dart';
import 'setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});

  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final AuthProvider _provider;

  @override
  void initState() {
    _provider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              _provider.getSMSDatas();
            },
            icon: const Icon(Icons.replay_outlined),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: StreamBuilder<List<SMSData>>(
        stream: _provider.smsDatas.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Colors.blue),
            );
          }
          final smsDatas = (snapshot.data ?? []).reversed.toList();
          return _smsDatasBuilder(smsDatas, context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SettingScreen(),
            ),
          );
        },
        tooltip: 'Setting',
        child: const Icon(Icons.settings),
      ),
    );
  }

  Widget _smsDatasBuilder(List<SMSData> smsDatas, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: List.generate(smsDatas.length, (i) {
          final smsData = smsDatas[i];
          if (!smsData.status) {
            if (smsData.sms.isNotNull) {
              createBackgroundTask(smsData.sms!.toSMS())
                  .then((_) => _provider.getSMSDatas());
            }
          }
          return Card(
            borderOnForeground: true,
            clipBehavior: Clip.hardEdge,
            color: Theme.of(context).colorScheme.onPrimary,
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        smsData.status ? "Thành công!" : "Thất bại!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              color: smsData.status ? Colors.green : Colors.red,
                            ),
                      ),
                      const SizedBox(height: 10),
                      CustomRichTextWidget(
                        defaultStyle: Theme.of(context).textTheme.bodyMedium!,
                        texts: [
                          TextSpan(
                            text: "Sender: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          (smsData.sms?.sender ?? "---"),
                        ],
                      ),
                      const SizedBox(height: 4),
                      CustomRichTextWidget(
                        defaultStyle: Theme.of(context).textTheme.bodyMedium!,
                        texts: [
                          TextSpan(
                            text: "message: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          (smsData.sms?.body ?? "---"),
                        ],
                      ),
                      const SizedBox(height: 4),
                      CustomRichTextWidget(
                        defaultStyle: Theme.of(context).textTheme.bodyMedium!,
                        texts: [
                          TextSpan(
                            text: "Timestamp: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          (smsData.sms?.timeReceived.toString() ?? "---"),
                        ],
                      ),
                      if (smsData.errorMsg.isNotNull) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiaryFixedDim
                                .withOpacity(0.25),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomRichTextWidget(
                            defaultStyle:
                                Theme.of(context).textTheme.bodyMedium!,
                            texts: [
                              TextSpan(
                                text: "error: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                              ),
                              (smsData.errorMsg ?? "---"),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                // if (!smsData.status) ...[
                //   Align(
                //     alignment: Alignment.centerRight,
                //     child: Container(
                //       margin: const EdgeInsets.only(right: 12),
                //       child: TextButton(
                //         onPressed: () {},
                //         iconAlignment: IconAlignment.end,
                //         child: const Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text("Gửi lại thủ công"),
                //             SizedBox(width: 8),
                //             Icon(Icons.send)
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                //   const SizedBox(height: 12),
                // ],
              ],
            ),
          );
        }),
      ),
    );
  }
}
