import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({
    Key? key,
    required this.contactName,
  }) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final List<Message> messages = [
    const Message(
      text: "Hi adhitya please give me feedback about my new shot?",
      time: "14:00",
      isMe: false,
    ),
    const Message(
      text: "My pleasure, please send me the link or image",
      time: "14:15",
      isMe: true,
    ),
    const Message(
      text: "Here it is! hope you like it!",
      time: "14:25",
      isMe: false,
      image: "assets/images/third screen.image.png",
    ),
    const Message(
      text: "Great work! lets schedule it tomorrow",
      time: "14:28",
      isMe: true,
    ),
    const Message(
      text: "okay, got it!",
      time: "14:30",
      isMe: false,
      showReactions: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: buildMessageList(),
            ),
            buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black54),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/secondcreen.first.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contactName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Typing...',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 170, 84, 3),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 234, 222),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Today',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 115, 0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...messages.map((message) => buildMessageItem(message)).toList(),
      ],
    );
  }

  Widget buildMessageItem(Message message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: message.isMe ? Colors.orange : Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(message.isMe ? 20 : 0),
                bottomRight: Radius.circular(message.isMe ? 0 : 20),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: message.isMe ? Colors.white : Colors.black,
                    fontSize: 15,
                  ),
                ),
                if (message.image != null) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      message.image!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: TextStyle(
                    color: message.isMe ? Colors.white70 : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (message.showReactions) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildReactionButton('👍'),
                  const SizedBox(width: 16),
                  buildReactionButton('❤️'),
                  const SizedBox(width: 16),
                  buildReactionButton('🔥'),
                  const SizedBox(width: 16),
                  buildReactionButton('+'),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildReactionButton(String emoji) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildInputArea() {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                icon: const Icon(Icons.emoji_emotions_outlined),
                color: Colors.grey.shade600,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                icon: const Icon(Icons.attach_file),
                color: Colors.grey.shade600,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFEDE1),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.send,
                color: Color(0xFFFF6F2E),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}

class Message {
  final String text;
  final String time;
  final bool isMe;
  final String? image;
  final bool showReactions;

  const Message({
    required this.text,
    required this.time,
    required this.isMe,
    this.image,
    this.showReactions = false,
  });
}
