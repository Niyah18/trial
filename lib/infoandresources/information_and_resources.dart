import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ensure you have this package added in your pubspec.yaml file

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        String time = DateFormat('h:mm a').format(DateTime.now()); // Ensure correct DateFormat pattern
        messages.add({"sender": "user", "message": _controller.text, "time": time});
        messages.add({
          "sender": "app",
          "message": "Here is the information you requested.",
          "time": time
        });
        _controller.clear(); // Ensure the controller is cleared after sending a message.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Your Question", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  sender: messages[index]["sender"]!,
                  message: messages[index]["message"]!,
                  time: messages[index]["time"]!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ask something...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to ExamplePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamplePage()), // Replace with your desired page
                );
              },
              child: Text("Go to Example Page"),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String sender;
  final String message;
  final String time;

  ChatBubble({required this.sender, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    bool isUser = sender == "user";
    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.grey[300] : Colors.teal[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isUser ? Radius.circular(0) : Radius.circular(15),
            bottomRight: isUser ? Radius.circular(15) : Radius.circular(0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 16, color: isUser ? Colors.black : Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(fontSize: 10, color: isUser ? Colors.black54 : Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Page", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text("This is an example page."),
      ),
    );
  }
}

