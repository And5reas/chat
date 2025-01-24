import 'dart:io';

import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage msg;
  final bool isCurrentUser;

  const MessageBubble({
    super.key,
    required this.msg,
    required this.isCurrentUser,
  });

  Widget _showUserImage(String imageUrl) {
    ImageProvider? provider;
    String defaultImage = 'lib/assets/images/avatar.png';

    final uri = Uri.parse(imageUrl);

    if (uri.path == defaultImage) {
      provider = AssetImage(defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toFilePath()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(isCurrentUser ? 12 : 0),
                  bottomRight: Radius.circular(isCurrentUser ? 0 : 12),
                ),
              ),
              width: 180,
              child: Column(
                crossAxisAlignment: isCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCurrentUser ? Colors.white : Colors.black),
                  ),
                  Text(
                    msg.text,
                    textAlign: isCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isCurrentUser ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isCurrentUser ? null : 165,
          right: isCurrentUser ? 165 : null,
          child: _showUserImage(msg.userImageUrl),
        ),
      ],
    );
  }
}
