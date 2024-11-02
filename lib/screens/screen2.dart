import 'package:flutter/material.dart';
import 'package:navigation_screens/screens/screen3.dart';

class ChatListItem {
  final String name;
  final String avatar;
  final String message;
  final String time;
  final int unreadCount;
  final bool isTyping;
  final bool isRead;

  ChatListItem({
    required this.name,
    required this.avatar,
    required this.message,
    required this.time,
    this.unreadCount = 0,
    this.isTyping = false,
    this.isRead = false,
  });
}

class Screen2 extends StatelessWidget {
  final List<ChatListItem> chatItems = [
    ChatListItem(
      name: "Faza Dzikrulloh",
      avatar: "assets/images/avatar1.png",
      message: "Typing...",
      time: "14.30",
      isTyping: true,
    ),
    ChatListItem(
      name: "Hatypo Studio",
      avatar: "assets/images/avatar2.png",
      message: "Can you help me to do with new project...",
      time: "14.30",
      unreadCount: 2,
    ),
    ChatListItem(
      name: "Zhofran A",
      avatar: "assets/images/avatar3.png",
      message: "I think we should upgrade the social media...",
      time: "14.00",
      unreadCount: 2,
    ),
    ChatListItem(
      name: "Vito Arvy",
      avatar: "assets/images/avatar4.png",
      message: "Okay adhit, I'll tell faza about it 👍",
      time: "13.40",
    ),
    ChatListItem(
      name: "Raul",
      avatar: "assets/images/avatar5.png",
      message: "Thanks Raul! 🙏✨",
      time: "Yesterday",
      isRead: true,
    ),
    ChatListItem(
      name: "Farhan Bagas",
      avatar: "assets/images/avatar6.png",
      message: "Great work farhan! 👍 I'll tell faza about logo...",
      time: "29/08/22",
      isRead: true,
    ),
    ChatListItem(
      name: "Abdull",
      avatar: "assets/images/avatar7.png",
      message: "Perfecto!🔥 I will check it later",
      time: "28/08/22",
      isRead: true,
    ),
    ChatListItem(
      name: "Ibe hatypo",
      avatar: "assets/images/avatar8.png",
      message: "nicely done bro!👍",
      time: "28/08/22",
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.orange[300],
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorPadding: const EdgeInsets.all(8),
                tabs: const [
                  Tab(text: 'Chat'),
                  Tab(text: 'Status'),
                  Tab(text: 'Calls'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildChatList(),
            buildStatusView(),
            buildCallsView(),
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

  Widget buildChatList() {
    return ListView.separated(
      itemCount: chatItems.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Colors.grey[200],
        indent: 80,
      ),
      itemBuilder: (context, index) {
        final item = chatItems[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.person,
              color: Colors.grey[400],
              size: 30,
            ),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Row(
            children: [
              if (!item.isTyping && item.message.startsWith("Faza"))
                Text(
                  "Faza • ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              Expanded(
                child: Text(
                  item.isTyping ? "Typing..." : item.message,
                  style: TextStyle(
                    color: item.isTyping ? Colors.orange : Colors.grey[600],
                    fontStyle:
                        item.isTyping ? FontStyle.italic : FontStyle.normal,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.time,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              if (item.unreadCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              else if (item.isRead)
                const Icon(
                  Icons.done_all,
                  color: Colors.orange,
                  size: 20,
                ),
            ],
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(contactName: item.name),
            ),
          ),
        );
      },
    );
  }

  Widget buildStatusView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_camera,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No status updates',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCallsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_missed,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No recent calls',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
