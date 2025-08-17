import 'package:flutter/material.dart';
import '../models.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = _seedChats();
    return ListView.separated(
      itemCount: chats.length,
      separatorBuilder: (_, __) => Divider(height: 1, color: Theme.of(context).dividerColor.withOpacity(0.2)),
      itemBuilder: (context, index) {
        final chat = chats[index];
        return _ChatListItem(chat: chat);
      },
    );
  }
}

class _ChatListItem extends StatelessWidget {
  const _ChatListItem({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250),
            pageBuilder: (_, anim, __) => FadeTransition(
              opacity: anim,
              child: ChatScreen(chat: chat),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Hero(
              tag: 'avatar_${chat.id}',
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(chat.avatarAsset),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        chat.time,
                        style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8)),
                        ),
                      ),
                      if (chat.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Chat> _seedChats() => [
  Chat(id: '1', name: 'Ali Hassan', lastMessage: 'تمام، نتكلم بكرة 👋', time: '12:45', unreadCount: 2, avatarAsset: 'assets/images/avatar_1.png'),
  Chat(id: '2', name: 'Mona Youssef', lastMessage: 'شكراً 🙏', time: '11:12', unreadCount: 0, avatarAsset: 'assets/images/avatar_2.png'),
  Chat(id: '3', name: 'Team', lastMessage: 'Zoom at 2pm', time: '09:20', unreadCount: 5, avatarAsset: 'assets/images/avatar_3.png'),
  Chat(id: '4', name: 'Ahmed Magdy', lastMessage: 'On my way 🚗', time: 'Yesterday', unreadCount: 0, avatarAsset: 'assets/images/avatar_4.png'),
];
