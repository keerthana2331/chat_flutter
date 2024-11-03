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
      image: "assets/images/third screen.image.png",
      time: "14:25",
      isMe: false,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: Colors.black54, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/avatar1.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 232, 96, 32),
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
              color: const Color(0xFFFFEDE1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Today',
              style: TextStyle(
                color: Color.fromARGB(255, 232, 87, 20),
                fontWeight: FontWeight.bold,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                decoration: BoxDecoration(
                  color: message.isMe
                      ? const Color(0xFFFF6F2E)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: Radius.circular(message.isMe ? 20 : 0),
                    bottomRight: Radius.circular(message.isMe ? 0 : 20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.text != null)
                            Text(
                              message.text!,
                              style: TextStyle(
                                color:
                                    message.isMe ? Colors.white : Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          if (message.image != null) ...[
                            if (message.text != null) const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                message.image!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, bottom: 6),
                      child: Text(
                        message.time,
                        style: TextStyle(
                          color: message.isMe ? Colors.white70 : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (message.showReactions) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F2E),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildReactionButton('👍'),
                      const SizedBox(width: 12),
                      buildReactionButton('❤️'),
                      const SizedBox(width: 12),
                      buildReactionButton('🔥'),
                      const SizedBox(width: 12),
                      buildReactionButton('+', isText: true),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget buildReactionButton(String emoji, {bool isText = false}) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        emoji,
        style: TextStyle(
          fontSize: isText ? 18 : 20,
          color: isText ? Colors.white : null,
        ),
      ),
    );
  }

  Widget buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    color: Colors.grey.shade600,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    color: Colors.grey.shade600,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFFFEDE1),
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: -0.5,
              child: const Icon(
                Icons.send,
                color: Color(0xFFFF6F2E),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}

class Message {
  final String? text;
  final String time;
  final bool isMe;
  final String? image;
  final bool showReactions;

  const Message({
    this.text,
    required this.time,
    required this.isMe,
    this.image,
    this.showReactions = false,
  });
}
