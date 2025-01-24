import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Notificações'),
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (ctx, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.body),
            onTap: () => service.remove(index),
          );
        },
      ),
    );
  }
}
