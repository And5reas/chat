import 'package:chat/core/services/notification/chat_push_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatPushNotificationService()),
      ],
      child: MaterialApp(
        title: 'Chat Andreas',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo, secondary: Colors.blue.shade700),
          useMaterial3: true,
        ),
        home: const AuthOrAppPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
