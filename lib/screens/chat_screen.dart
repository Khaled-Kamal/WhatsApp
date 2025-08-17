import 'package:flutter/material.dart';
import '../models.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.chat});

  final Chat chat;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Message> _messages = [
    Message(id: 'm1', text: 'Hey! How are you?', isMe: false, timestamp: DateTime.now().subtract(const Duration(minutes: 10))),
    Message(id: 'm2', text: 'All good! Working on the task.', isMe: true, timestamp: DateTime.now().subtract(const Duration(minutes: 9))),
  ];

  void _handleSend(String text) {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isMe: true,
      timestamp: DateTime.now(),
    );
    _messages.add(message);
    _listKey.currentState?.insertItem(_messages.length - 1, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Hero(
              tag: 'avatar_${widget.chat.id}',
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.chat.avatarAsset),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chat.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                Text('online', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.9))),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _messages.length,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemBuilder: (context, index, animation) {
                final msg = _messages[index];
                return SizeTransition(
                  sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
                  child: FadeTransition(
                    opacity: animation,
                    child: MessageBubble(message: msg),
                  ),
                );
              },
            ),
          ),
          ChatInputBar(onSend: _handleSend),
        ],
      ),
    );
  }
}
