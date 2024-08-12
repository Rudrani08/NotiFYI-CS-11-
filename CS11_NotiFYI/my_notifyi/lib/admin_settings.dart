import 'package:flutter/material.dart';
import 'package:my_notifyi/admin_password.dart';
import 'package:my_notifyi/admin_home.dart';
import 'package:my_notifyi/admin_login.dart';

class AdminSetting extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<AdminSetting> {
  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  builder: (context) => AdminHome(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {
                // Navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminSetting()),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(''),
                  radius: 24,
                ),
                title: Text('deanadmin@banasthali.in'),
                //subtitle: Text('btbtc21032_vaishnavi@banasthali.in'),
                onTap: () {
                  // Add your account onTap logic here
                },
              ),
              ListTile(
                title: Text('Notifications'),
                leading: Icon(Icons.notifications),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                trailing: Switch(
                  value: isNotificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNotificationEnabled = value;
                    });
                  },
                  activeTrackColor: Color.fromARGB(255, 34, 67, 255),
                ),
              ),
              ListTile(
                title: Text('Forget Password'),
                leading: Icon(Icons.lock),
                onTap: () {
                  // Add your onTap logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailInputPage()),
                  );
                },
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.info),
                onTap: () {
                  // Add your onTap logic here
                  _showAboutDialog(context);
                },
              ),
              ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do you want to log out?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Adminlogin()),
                              );
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
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
