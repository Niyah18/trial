import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you have provider package added to your pubspec.yaml file
import 'package:trial/themes/theme_provider.dart'; // Import your ThemeProvider

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.teal),
              title: Text('Support Groups'),
              onTap: () {
                Navigator.pushNamed(context, '/support_groups');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.teal),
              title: Text('Information & Resources'),
              onTap: () {
                Navigator.pushNamed(context, '/information_and_resources');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.teal),
              title: Text('Nearby Resources'),
              onTap: () {
                Navigator.pushNamed(context, '/nearby_resources');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.help_outline, color: Colors.teal),
              title: Text('Personalized Advice'),
              onTap: () {
                Navigator.pushNamed(context, '/personalised_advice');
              },
            ),
          ),
          Card(
            child: ExpansionTile(
              leading: Icon(Icons.settings, color: Colors.teal),
              title: Text('Settings'),
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.teal),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.visibility_off, color: Colors.teal),
                  title: Text('Hidden Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, '/hidden_profile');
                  },
                ),
                SwitchListTile(
                  secondary: Icon(Icons.brightness_6, color: Colors.teal),
                  title: Text('Theme Change'),
                  value: themeProvider.isDarkTheme,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help, color: Colors.teal),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.teal),
                  title: Text('Notifications'),
                  onTap: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.storage, color: Colors.teal),
                  title: Text('Data Storage'),
                  onTap: () {
                    Navigator.pushNamed(context, '/data_storage');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.teal),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pushNamed(context, '/logout');
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
