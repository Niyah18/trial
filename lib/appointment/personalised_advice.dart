import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hello user! How are you doing?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Available doctors for you:',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // List of doctors (replace with your actual list)
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Dr. John Smith'),
                  subtitle: const Text('Cardiologist'),
                  onTap: () {
                    // Navigate to Dr. John Smith's page
                  },
                ),
                ListTile(
                  title: const Text('Dr. Emily Johnson'),
                  subtitle: const Text('Psychiatrist'),
                  onTap: () {
                    // Navigate to Dr. Emily Johnson's page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
