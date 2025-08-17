import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key, required this.onSend});

  final void Function(String) onSend;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).colorScheme.surface;
    return SafeArea(
      top: false,
      child: Container(
        color: bg,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? const Color(0xFFF0F0F0)
                      : const Color(0xFF1F2C34),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions_outlined, color: Theme.of(context).textTheme.bodySmall?.color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    Icon(Icons.attach_file, color: Theme.of(context).textTheme.bodySmall?.color),
                    const SizedBox(width: 6),
                    Icon(Icons.camera_alt, color: Theme.of(context).textTheme.bodySmall?.color),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                final text = _controller.text.trim();
                if (text.isEmpty) return;
                widget.onSend(text);
                _controller.clear();
                setState(() {});
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                  child: _controller.text.trim().isEmpty
                      ? const Icon(Icons.mic, key: ValueKey('mic'), color: Colors.white)
                      : const Icon(Icons.send, key: ValueKey('send'), color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
