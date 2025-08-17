import 'package:flutter/material.dart';
import '../models.dart';
import 'story_viewer.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = _seedStories();
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final s = stories[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          leading: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2),
            ),
            child: CircleAvatar(backgroundImage: AssetImage(s.avatarAsset), radius: 22),
          ),
          title: Text(s.userName, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: const Text('Just now'),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 250),
                pageBuilder: (_, anim, __) => ScaleTransition(
                  scale: Tween<double>(begin: 0.98, end: 1).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
                  child: FadeTransition(opacity: anim, child: StoryViewer(story: s)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

List<Story> _seedStories() => [
  Story(id: 's1', userName: 'Ali Hassan', avatarAsset: 'assets/images/avatar_1.png', imageAssets: [
    'assets/images/avatar_1.png',
    'assets/images/avatar_2.png',
  ]),
  Story(id: 's2', userName: 'Mona Youssef', avatarAsset: 'assets/images/avatar_2.png', imageAssets: [
    'assets/images/avatar_3.png',
  ]),
  Story(id: 's3', userName: 'Ahmed Magdy', avatarAsset: 'assets/images/avatar_4.png', imageAssets: [
    'assets/images/avatar_4.png',
    'assets/images/avatar_1.png',
    'assets/images/avatar_3.png',
  ]),
];
