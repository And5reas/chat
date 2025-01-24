import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Batata frita',
      createAt: DateTime.now(),
      userId: '1',
      userName: 'Andreas',
      userImageUrl: 'lib/assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Arroz',
      createAt: DateTime.now(),
      userId: '2',
      userName: 'Sarah',
      userImageUrl: 'lib/assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Sim, Batata',
      createAt: DateTime.now(),
      userId: '1',
      userName: 'Andreas',
      userImageUrl: 'lib/assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    _msgs.add(newMessage);

    _controller?.add(_msgs);

    return newMessage;
  }
}
