import 'package:background_listen_sms/config/base_config.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _baseURLController =
      TextEditingController(text: BaseConfig.ins.baseURL);
  final _endPointController =
      TextEditingController(text: BaseConfig.ins.endPoint);

  @override
  void initState() {
    super.initState();
    _endPointController.addListener(
      () {
        BaseConfig.ins.endPoint = _endPointController.text;
      },
    );

    _baseURLController.addListener(
      () {
        BaseConfig.ins.baseURL = _baseURLController.text;
      },
    );
  }

  @override
  void dispose() {
    _endPointController.removeListener(() {});
    _baseURLController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Giao thức:",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    value: true,
                    groupValue: BaseConfig.ins.protocolHttp,
                    onChanged: (value) {
                      BaseConfig.ins.protocolHttp = value ?? false;
                      setState(() {});
                    },
                    title: Text(
                      "http",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    value: false,
                    groupValue: BaseConfig.ins.protocolHttp,
                    onChanged: (value) {
                      BaseConfig.ins.protocolHttp = value ?? false;
                      setState(() {});
                    },
                    title: Text(
                      "https",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text("BaseURL:", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            TextField(
              controller: _baseURLController,
              decoration: const InputDecoration(
                hintText: "Nhập BaseURL...",
                border: OutlineInputBorder(),
                labelText: "BaseURL",
              ),
            ),
            const SizedBox(height: 40),
            Text("EndPoint:", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            TextField(
              controller: _endPointController,
              decoration: const InputDecoration(
                hintText: "Nhập EndPoint...",
                border: OutlineInputBorder(),
                labelText: "EndPoint",
              ),
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                onPressed: Navigator.of(context).pop,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                child: Container(
                  height: 44,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Hoàn thành",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
