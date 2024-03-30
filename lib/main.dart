import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/home/screens/initialization_screen.dart';
import 'features/notifications/controllers/alarm_action_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness: Brightness.dark,
  ));
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '0',
        channelName: 'Sunrise',
        channelDescription: 'Sunrise',
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '1',
        channelName: 'Fazr',
        channelDescription: 'Fazr',
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '2',
        channelName: 'Dhuhr',
        channelDescription: 'Dhuhr',
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '3',
        channelName: 'Asr',
        channelDescription: 'Asr',
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '4',
        channelName: 'Magrib',
        channelDescription: 'Magrib',
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '5',
        channelName: 'Isha',
        channelDescription: 'Isha',
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'Salah',
        channelGroupName: 'Salah Channel',
      ),
    ],
  );
  bool isNotificationsAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotificationsAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
    main();
  }
  runApp(const ProviderScope(child: BarometerOfImaan()));
}

class BarometerOfImaan extends StatefulWidget {
  const BarometerOfImaan({super.key});

  @override
  State<BarometerOfImaan> createState() => _BarometerOfImaanState();
}

class _BarometerOfImaanState extends State<BarometerOfImaan> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationActionServices.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationActionServices.onNotificationCreatedMethod,
      onDismissActionReceivedMethod:
          NotificationActionServices.onActionReceivedMethod,
      onNotificationDisplayedMethod:
          NotificationActionServices.onNotificationDisplayedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barometer of Imaan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const InitializationScreen(),
    );
  }
}
