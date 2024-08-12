import 'package:flutter/material.dart';
import 'package:my_notifyi/Btech.dart';
import 'package:my_notifyi/banasthali.dart';
import 'package:my_notifyi/settings.dart';
//import 'package:my_notifyi/home.dart';
import 'package:my_notifyi/user_starred.dart';

class Placement extends StatefulWidget {
  const Placement({super.key});

  @override
  State<Placement> createState() => PlacementState();
}

class PlacementState extends State<Placement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSearching = false;
  List<bool> _starredEvents =
      List.filled(7, false); // List to track starred events

  final List<String> imageUrls = [
    // 'assets/app_icon.jpeg',
    // 'assets/Finalll_logo.png',
    // 'assets/meme_notice.jpeg',
    // 'assets/noti.jpeg',
    // 'assets/notic.jpeg',
    'assets/notice.jpeg',
    'assets/not.jpeg',
  ];

  // Sample event dates
  List<String> eventDates = ['02-04-2024', '28-03-2024'];

  // Sample category names
  List<String> categoryNames = [
    'Placement Cell',
    'Placement Cell',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: _isSearching
            ? const TextField(
                decoration: InputDecoration(
                  hintText: 'Search notices',
                  hintStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              )
            : const Text('Notices', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 22, 25, 149),
        automaticallyImplyLeading: false, // Remove back arrow
        actions: [
          IconButton(
            onPressed: () => setState(() => _isSearching = !_isSearching),
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Banasthali (University Level)'),
              // ... (onTap for navigation)
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bnsthli())); // Close Drawer
                // Navigate to BanasthaliPage or any other page you want
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Placement Cell'),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Placement()));
              },
              // ... (onTap for navigation)
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('B.Tech'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Btech())); // Close Drawer
                // Navigate to B.Tech Page or any other page you want
              },
              // ... (onTap for navigation)
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // GridView block
            Padding(
              padding:
                  const EdgeInsets.all(3.0), // Reduced padding for GridView
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imageUrls.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0, // Reduced spacing
                  mainAxisSpacing: 5.0, // Reduced spacing
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _openDetailPage(index); // Define your action here
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200, // Increased height for the image
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                            height: 4), // Reduced space for event name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _toggleStarred(index);
                              },
                              child: Icon(
                                _starredEvents[index]
                                    ? Icons.star
                                    : Icons.star_border,
                                color: _starredEvents[index]
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Event Name ${index + 1}', // Replace with actual event name
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                width:
                                    4), // Spacing between event name and link icon
                            GestureDetector(
                              onTap: () {
                                _showEventDetails(index);
                              },
                              child: const Icon(
                                Icons.link,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 4), // Spacing between event name and date
                        Text(
                          'Date: ${eventDates[index]}', // Displaying event date
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // ... (display images with descriptions and event dates)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
                // Implement action for camera icon
              },
            ),
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                // Navigate to StarredImagesPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StarredImagesPage(
                      starredEvents: _starredEvents,
                      imageUrls: imageUrls,
                      eventDates: eventDates,
                      categoryNames: categoryNames,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Implement action for settings icon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEventDetails(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 300, // Fixed height for the enlarged image
                width: 300, // Fixed width for the enlarged image
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Event Name ${index + 1}', // Replace with actual event name
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Date: ${eventDates[index]}', // Displaying event date
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                  'Description: Add your description here'), // Add your description
              // SizedBox(height: 8),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         // Implement any action here when the button is pressed
              //       },
              //       child: Text('Action'),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleStarred(int index) {
    setState(() {
      _starredEvents[index] = !_starredEvents[index];
    });
  }

  void _openDetailPage(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 480, // Fixed height for the image
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Event Name ${index + 1}', // Replace with actual event name
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Date: ${eventDates[index]}', // Displaying event date
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
