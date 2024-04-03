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
        onlyAlertOnce: true,
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '1',
        channelName: 'Fazr',
        channelDescription: 'Fazr',
        onlyAlertOnce: true,
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '2',
        channelName: 'Dhuhr',
        channelDescription: 'Dhuhr',
        onlyAlertOnce: true,
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '3',
        channelName: 'Asr',
        channelDescription: 'Asr',
        onlyAlertOnce: true,
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '4',
        channelName: 'Magrib',
        channelDescription: 'Magrib',
        onlyAlertOnce: true,
      ),
      NotificationChannel(
        channelGroupKey: 'Salah',
        channelKey: '5',
        channelName: 'Isha',
        channelDescription: 'Isha',
        onlyAlertOnce: true,
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


// import 'dart:convert';

// void main() {
//   // Sample JSON data
//   List<Map<String, dynamic>> verses =;

//   String replacementStrings = '''

//   ''';

//   List<String> replacementLines = replacementStrings.split('\n');

//   int minCount = verses.length < replacementLines.length
//       ? verses.length
//       : replacementLines.length;

//   for (int i = 0; i < minCount; i++) {
//     verses[i]['transliteration_en'] = replaceHtmlTags(replacementLines[i]);
//   }

//   String modifiedJsonString = json.encode(verses);

//   print(modifiedJsonString);
// }

// String replaceHtmlTags(String htmlString) {
//   // Trim each line, replace HTML tags and remove single quotes
//   return htmlString
//       .split('\n') // Split by newline
//       .map((line) => line.trim()) // Trim each line
//       .where((line) => line.isNotEmpty) // Remove empty lines
//       .join(' ') // Join lines back with space
//       .replaceAll(RegExp(r'<[^>]*>'), '') // Replace HTML tags
//       .replaceAll("'", ''); // Remove single quotes
// }
