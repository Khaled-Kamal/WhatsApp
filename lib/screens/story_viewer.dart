import 'dart:async';
import 'package:flutter/material.dart';
import '../models.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key, required this.story});

  final Story story;

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> with SingleTickerProviderStateMixin {
  int _index = 0;
  late final AnimationController _progress;

  @override
  void initState() {
    super.initState();
    _progress = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _next();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  void _next() {
    if (_index < widget.story.imageAssets.length - 1) {
      setState(() => _index++);
      _progress
        ..value = 0
        ..forward();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  void _prev() {
    if (_index > 0) {
      setState(() => _index--);
      _progress
        ..value = 0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(widget.story.imageAssets[_index], fit: BoxFit.cover),
            ),
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: Row(
                children: List.generate(widget.story.imageAssets.length, (i) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: AnimatedBuilder(
                        animation: _progress,
                        builder: (_, __) => LinearProgressIndicator(
                          value: i < _index ? 1 : i == _index ? _progress.value : 0,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 3,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              top: 54,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(widget.story.avatarAsset)),
                  const SizedBox(width: 8),
                  Text(widget.story.userName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(child: GestureDetector(onTap: _prev)),
                  Expanded(child: GestureDetector(onTap: _next)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
