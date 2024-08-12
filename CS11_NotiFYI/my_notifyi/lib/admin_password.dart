import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmailInputPage(),
    );
  }
}

class EmailInputPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotiFYI', style: TextStyle(color: Colors.white)),

        backgroundColor:
            Color.fromARGB(255, 22, 25, 149), // Set title bar color to blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            SizedBox(height: 16), // Add some spacing below the title bar

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: '@banasthali.in',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                _showVerificationDialog(context, email);
              },
              child: Text('Next'),
            ),
            // mainAxisAlignment : MainAxisAlignment.centre,
            SizedBox(height: 16),
            Text(
              'OR',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Your Department For Further Details If Recovery Mail Not Found',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showVerificationDialog(BuildContext context, String email) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Check Your Mail'),
        content:
            Text('Verification code sent to $email. Please check your mail.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _navigateToVerificationPage(context, email);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void _navigateToVerificationPage(BuildContext context, String email) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VerificationPage(email: email),
    ),
  );
}

//VERIFICATION PAGE

class VerificationPage extends StatelessWidget {
  final String email;
  final TextEditingController verificationController = TextEditingController();

  VerificationPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotiFYI'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text('Enter the verification code sent to $email'),
            SizedBox(height: 16),
            TextField(
              controller: verificationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Verification Code',
                // hintText: '6-Character Code',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showVerificationDiallog(context);
              },
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showVerificationDiallog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Verification successful!'),
        content: Text('Check Your Mail'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
