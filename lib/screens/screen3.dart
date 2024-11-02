import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  ChatScreen({required this.contactName});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'other',
      'message': 'Hi Adhitya, please give me feedback about my new shot?',
      'time': '14:00'
    },
    {
      'sender': 'me',
      'message': 'My pleasure, please send me the link or image',
      'time': '14:15'
    },
    {
      'sender': 'other',
      'message': 'Here it is! Hope you like it!',
      'image': 'assets/screenshot.png',
      'time': '14:25'
    },
    {
      'sender': 'me',
      'message': 'Great work! Let\'s schedule it tomorrow',
      'time': '14:28'
    },
    {
      'sender': 'other',
      'message': 'Okay, got it!',
      'time': '14:30',
      'showEmojiBar': true
    },
  ];

  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          'sender': 'me',
          'message': messageController.text,
          'time': '14:35',
        });
      });
      messageController.clear();
    }
  }

  Widget buildMessage(Map<String, dynamic> message, bool showDateLabel) {
    bool isMe = message['sender'] == 'me';
    bool showEmojiBar = message['showEmojiBar'] == true;

    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (showDateLabel)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  "Today",
                  style: TextStyle(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.orange : Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
              bottomLeft: Radius.circular(isMe ? 10 : 0),
              bottomRight: Radius.circular(isMe ? 0 : 10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message['message'],
                style: TextStyle(color: isMe ? Colors.white : Colors.black),
              ),
              if (message['image'] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    message['image'],
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            message['time'],
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        if (showEmojiBar)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thumb_up, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.whatshot, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.add, color: Colors.white),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.contactName,
                    style: const TextStyle(color: Colors.black)),
                const Text(
                  'Typing...',
                  style: TextStyle(fontSize: 12, color: Colors.orangeAccent),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.video_call, color: Colors.black54),
          SizedBox(width: 15),
          Icon(Icons.call, color: Colors.black54),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.black54),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool showDateLabel = index == 0;
                return buildMessage(messages[index], showDateLabel);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.emoji_emotions, color: Colors.orange),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.attachment, color: Colors.orange),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: FloatingActionButton(
                    onPressed: sendMessage,
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
