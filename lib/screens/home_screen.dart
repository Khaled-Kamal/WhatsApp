import 'package:flutter/material.dart';
import '../models.dart';
import 'chat_list_screen.dart';
import 'stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Chats, Status
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'CHATS' ,),
            Tab(text: 'STATUS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatListScreen(),
          StoriesScreen(),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  Widget _buildFab() {
    final isChats = _tabController.index == 0;
    return FloatingActionButton(
      onPressed: () {},
      tooltip: isChats ? 'New chat' : 'New status',
      child: Icon(isChats ? Icons.chat : Icons.camera_alt),
    );
  }
}
