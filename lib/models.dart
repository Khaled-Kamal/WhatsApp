class Chat {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarAsset;

  Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    required this.avatarAsset,
  });
}

class Message {
  final String id;
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

class Story {
  final String id;
  final String userName;
  final String avatarAsset;
  final List<String> imageAssets;

  Story({
    required this.id,
    required this.userName,
    required this.avatarAsset,
    required this.imageAssets,
  });
}
