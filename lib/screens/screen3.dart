import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Faza Dzikrulloh', style: TextStyle(color: Colors.black)),
            Text('Typing...',
                style: TextStyle(color: Colors.orange, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Today',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                ChatBubble(
                  text:
                      'Hi adhitaya please give me feedback about my new shot?',
                  time: '14:00',
                  isSentByMe: false,
                ),
                ChatBubble(
                  text: 'My pleasure, please send me the link or image',
                  time: '14:15',
                  isSentByMe: true,
                ),
                ChatBubble(
                  text: 'Here it is! hope you like it!',
                  time: '14:25',
                  isSentByMe: false,
                  hasImage: true,
                ),
                ChatBubble(
                  text: 'Great work! Let\'s schedule it tomorrow',
                  time: '14:28',
                  isSentByMe: true,
                ),
                ChatBubble(
                  text: 'Okay, got it!',
                  time: '14:30',
                  isSentByMe: false,
                ),
              ],
            ),
          ),
          EmojiPicker(),
          MessageInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isSentByMe;
  final bool hasImage;

  ChatBubble(
      {required this.text,
      required this.time,
      this.isSentByMe = false,
      this.hasImage = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (hasImage)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 200,
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Text('Image Placeholder')),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.orange : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              time,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class EmojiPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.thumb_up, color: Colors.orange),
          Icon(Icons.favorite, color: Colors.orange),
          Icon(Icons.whatshot, color: Colors.orange),
          Icon(Icons.add, color: Colors.orange),
        ],
      ),
    );
  }
}

class MessageInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.tag_faces, color: Colors.grey),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
