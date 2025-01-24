import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('Sem mensagens, bó conversar'),
          );
        } else {
          final msgs = snapshot.data!.reversed.toList();
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (ctx, index) {
              final msg = msgs[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(msg.userImageUrl),
                ),
                title: Text(msg.text),
              );
            },
          );
        }
      },
    );
  }
}
