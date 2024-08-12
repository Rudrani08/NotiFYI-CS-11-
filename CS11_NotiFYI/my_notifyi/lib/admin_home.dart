import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:my_notifyi/admin_settings.dart';
import 'package:my_notifyi/admin_starred.dart';
import 'package:my_notifyi/Btech.dart';
import 'package:my_notifyi/banasthali.dart';
import 'package:my_notifyi/placement.dart'; // Import the new StarredImagesPage

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key});

  @override
  State<AdminHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSearching = false;
  Uint8List? _imageBytes;

  List<String> imageUrls = [
    'assets/meme_notice.jpeg',
    'assets/noti.jpeg',
    'assets/notic.jpeg',
    'assets/notice.jpeg',
    'assets/not.jpeg',
  ];
  List<String> eventDates = [
    '27-03-2024',
    '20-03-2024',
    '18-03-2024',
    '18-03-2024',
    '15-03-2024'
  ];
  List<String> categoryNames = [
    'B.Tech',
    'Banasthali (University Level)',
    'Banasthali(Univeristy Level)',
    'Placement Cell',
    'B.Tech'
  ];
  // Track which events are starred
  Set<int> starredEvents = Set();

  void _setImage(Uint8List bytes) {
    // This method should only update the image when called from EventFormScreen
    if (mounted) {
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  void addEvent(String imageUrl, String eventDate, String eventName,
      String eventDescription,
      {bool isStarred = false}) {
    setState(() {
      imageUrls.add(imageUrl);
      eventDates.add(eventDate);
      if (isStarred) {
        starredEvents.add(imageUrls.length - 1);
      }
    });
  }

  void _deleteImage(int index) {
    setState(() {
      imageUrls.removeAt(index);
      eventDates.removeAt(index);
      // Remove from starred events if it was starred
      if (starredEvents.contains(index)) {
        starredEvents.remove(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: _isSearching
            ? const TextField(
                decoration: InputDecoration(
                  hintText: 'Search notices',
                  hintStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              )
            : const Text('Notices', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 22, 25, 149),
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
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                leading: Icon(Icons.school),
                title: Text('Banasthali (University Level)'),
                // ... (onTap for navigation)
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bnsthli()));
                }),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Placement Cell'),
              // ... (onTap for navigation)
              onTap: () {
                Navigator.pop(context); // Close Drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Placement()));
              },
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('B.Tech'),
              // ... (onTap for navigation)
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Btech())); // Close Drawer
                // Navigate to B.Tech Page or any other page you want
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0), // Reduced padding for GridView
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imageUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  bool isStarred = starredEvents.contains(index);
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _openDetailPage(index);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isStarred ? Icons.star : Icons.star_border,
                                    color: isStarred
                                        ? Color.fromARGB(255, 33, 150, 243)
                                        : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (isStarred) {
                                        starredEvents.remove(index);
                                      } else {
                                        starredEvents.add(index);
                                      }
                                    });
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Event Name ${index + 1}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Date: ${eventDates[index]}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.link),
                                  color: Colors.blue,
                                  onPressed: () {
                                    _showEventDetails(context, index);
                                  },
                                ),
                                IconButton(
                                  icon:
                                      Icon(Icons.delete), // Bin icon for delete
                                  color: Colors.grey,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Event'),
                                          content: Text(
                                              'Are you sure you want to delete this event?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _deleteImage(index);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 22, 25, 149),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                EventFormScreen(setImage: _setImage, addEvent: addEvent),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHome()),
                );
                // Implement action for home icon
              },
            ),
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StarredImagesAdminPage(
                      imageUrls: imageUrls,
                      eventDates: eventDates,
                      categoryNames: categoryNames,
                      starredEvents: starredEvents,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Implement action for settings icon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminSetting()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEventDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category: ${categoryNames[index]}'),
              Text('Event Name: Event Name ${index + 1}'),
              SizedBox(height: 8),
              Text('Event Date: Date ${index + 1}'),
              SizedBox(height: 8),
              Text('Event Description: Description ${index + 1}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
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
              SizedBox(height: 8),
              Text(
                'Event Name ${index + 1}', // Replace with actual event name
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Date: ${eventDates[index]}', // Displaying event date
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EventFormScreen extends StatefulWidget {
  final void Function(Uint8List) setImage;
  final void Function(String, String, String, String, {bool isStarred})
      addEvent;

  EventFormScreen({required this.setImage, required this.addEvent});

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  late TextEditingController _eventNameController;
  late TextEditingController _eventDescriptionController;
  late DateTime _eventDate;
  File? _imageFile;
  String _selectedCategory = 'Category A'; // Default selected category

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _eventDescriptionController = TextEditingController();
    _eventDate = DateTime.now();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDescriptionController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      widget.setImage(Uint8List.fromList(bytes));
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    String imageUrl = _imageFile != null ? _imageFile!.path : '';
    String eventDate =
        '${_eventDate.day}-${_eventDate.month}-${_eventDate.year}';
    String eventName = _eventNameController.text.trim();
    String eventDescription = _eventDescriptionController.text.trim();

    // Call the callback to add the event
    widget.addEvent(imageUrl, eventDate, eventName, eventDescription);

    Navigator.pop(context); // Close the form screen
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 16),
            TextField(
              controller: _eventNameController,
              decoration: InputDecoration(
                labelText: 'Event Name',
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _eventDescriptionController,
              decoration: InputDecoration(
                labelText: 'Event Description',
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Category:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                // Radio buttons for categories
                Radio<String>(
                  value: 'Category A',
                  groupValue: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                Text('Banasthali'),
                SizedBox(width: 16),
                Radio<String>(
                  value: 'Category B',
                  groupValue: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                Text('Placement Cell'),
                SizedBox(width: 16),
                Radio<String>(
                  value: 'Category C',
                  groupValue: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                Text('B.Tech'),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(
                'Attach Image',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 12),
            if (_imageFile != null && _imageFile!.path.isNotEmpty)
              kIsWeb
                  ? Image.network(
                      _imageFile!.path,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      _imageFile!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Event Date:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _eventDate = selectedDate;
                      });
                    }
                  },
                  child: Text(
                    '${_eventDate.day}/${_eventDate.month}/${_eventDate.year}',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
