import 'package:flutter/material.dart';

class ChatroomPage extends StatefulWidget {
  const ChatroomPage({Key? key}) : super(key: key);

  @override
  _ChatroomPageState createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> contacts = [
    {"name": "John Doe", "detail": "Dealt with alcohol addiction"},
    {"name": "Family Support Group", "detail": "Families dealing with drug abuse"},
    {"name": "Jane Smith", "detail": "Dealt with opioid addiction"},
  ];

  List<Map<String, String>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts; // Initially display all contacts
  }

  void filterContacts(String searchText) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact['name']!.toLowerCase().contains(searchText.toLowerCase()) ||
              contact['detail']!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chatroom")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[200]!, Colors.blue[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: "Search people or groups",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.blue[800]),
                ),
                onChanged: (value) {
                  filterContacts(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to chat with this person or group
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailPage(
                            name: filteredContacts[index]['name']!,
                            detail: filteredContacts[index]['detail']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[700],
                          child: Text(
                            filteredContacts[index]['name']![0], // First letter of name
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          filteredContacts[index]['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          filteredContacts[index]['detail']!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: ElevatedButton.icon(
                          icon: const Icon(Icons.chat),
                          label: const Text("Chat"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailPage(
                                  name: filteredContacts[index]['name']!,
                                  detail: filteredContacts[index]['detail']!,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String name;
  final String detail;

  const ChatDetailPage({Key? key, required this.name, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Text("Chat with $name\n($detail)"),
      ),
    );
  }
}
