import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'HALODEK',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey[700]),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey[700]),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16.0),
            tabs: [
              Tab(text: 'Chat'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildChatList(),
            const Center(child: Text('Status')),
            const Center(child: Text('Calls')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return ListView(
      children: [
        _buildChatItem(
          avatar: 'assets/avatar1.png',
          name: 'Faza Dzikrulloh',
          message: 'Typing...',
          time: '14:30',
          isTyping: true,
        ),
        _buildChatItem(
          avatar: 'assets/avatar2.png',
          name: 'Hatypo Studio',
          message: 'Can you help me to do with new project...',
          time: '14:30',
          unreadCount: 2,
        ),
        _buildChatItem(
          avatar: 'assets/avatar3.png',
          name: 'Zhofran A',
          message: 'I think we should upgrade the social media...',
          time: '14:00',
        ),
      ],
    );
  }

  Widget _buildChatItem({
    required String avatar,
    required String name,
    required String message,
    required String time,
    int unreadCount = 0,
    bool isTyping = false,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatar),
        radius: 25,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: isTyping ? Colors.orange : Colors.grey[600],
          fontStyle: isTyping ? FontStyle.italic : FontStyle.normal,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$unreadCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: () {},
    );
  }
}
