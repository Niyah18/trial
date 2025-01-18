import 'package:flutter/material.dart';

class NearbyLocationPage extends StatefulWidget {
  @override
  _NearbyLocationPageState createState() => _NearbyLocationPageState();
}

class _NearbyLocationPageState extends State<NearbyLocationPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> locations = [
    {"name": "Sunshine Recovery Center", "description": "Located in downtown, offers full support."},
    {"name": "Haven Family Clinic", "description": "Provides mental health and addiction recovery services."},
    {"name": "Community Health Hub", "description": "Local resource for family addiction support."},
  ]; // Sample data

  List<Map<String, String>> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = locations; // Initially display all locations
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  void filterLocations(String searchText) {
    setState(() {
      filteredLocations = locations
          .where((location) =>
              location['name']!.toLowerCase().contains(searchText.toLowerCase()) ||
              location['description']!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Nearby Locations"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Enter your location",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                filterLocations(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to location details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationDetailPage(
                          name: filteredLocations[index]['name']!,
                          description: filteredLocations[index]['description']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: ListTile(
                      title: Text(filteredLocations[index]['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(filteredLocations[index]['description']!,
                          style: TextStyle(color: Colors.grey[600])),
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationDetailPage extends StatelessWidget {
  final String name;
  final String description;

  LocationDetailPage({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            // Additional details can be added here
          ],
        ),
      ),
    );
  }
}
