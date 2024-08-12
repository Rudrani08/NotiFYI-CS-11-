import 'package:flutter/material.dart';
import 'package:my_notifyi/home.dart';
import 'package:my_notifyi/login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationEnabled = true; // Initial notification status

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 25, 149),
          title: const Text('Settings', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserHome(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {
                // Navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors
                .white, // Light orange background color // Optional: Add rounded corners
            shape: BoxShape.rectangle,
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              // Account ListTile
              ListTile(
                leading: const CircleAvatar(
                  // Add your profile picture logic here
                  backgroundImage: AssetImage('assets/Finalll_logo.png'),
                  radius: 24,
                ),
                // leading: Icon(Icons.account_circle_sharp, size: 50),
                title: const Text('Sanskriti Bhardwaj'),
                subtitle: const Text('btbtc21014_sanskriti@banasthali.in'),
                onTap: () {
                  // Add your account onTap logic here
                },
              ),

              // Notifications ListTile
              ListTile(
                title: const Text('Notifications'),
                leading: const Icon(Icons.notifications),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                trailing: Switch(
                  value: isNotificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNotificationEnabled = value;
                    });
                  },
                  activeTrackColor: const Color.fromARGB(
                      255, 34, 67, 255), // Set active track color
                  // Set active color
                ),
              ),

              // About ListTile
              ListTile(
                title: const Text('About'),
                leading: const Icon(Icons.info),
                onTap: () {
                  // Add your onTap logic here
                  _showAboutDialog(context);
                },
              ),

              // Log out ListTile
              ListTile(
                title: const Text('Log out'),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  // Add your onTap logic here
                },
              ),
              // Add more ListTile widgets for additional settings
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption('Privacy Policy', 'View our privacy policy'),
              _buildOption('Terms of Use', 'Read our terms of use'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(String title, String description) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        // Add your logic for handling each option tap
        print('$title tapped');
      },
    );
  }
}
