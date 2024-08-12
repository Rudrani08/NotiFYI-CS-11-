import 'package:flutter/material.dart';

class StarredImagesAdminPage extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> eventDates;
  final List<String> categoryNames;
  final Set<int> starredEvents;

  StarredImagesAdminPage({
    required this.imageUrls,
    required this.eventDates,
    required this.categoryNames,
    required this.starredEvents,
  });

  @override
  Widget build(BuildContext context) {
    List<String> starredUrls = [];
    List<String> starredEventDates = [];
    List<String> starredCategoryNames = [];

    for (int i = 0; i < imageUrls.length; i++) {
      if (starredEvents.contains(i)) {
        starredUrls.add(imageUrls[i]);
        starredEventDates.add(eventDates[i]);
        starredCategoryNames.add(categoryNames[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Starred Notices', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 22, 25, 149),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: starredUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        child: Image.network(
                          starredUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 33, 150, 243),
                            ),
                            onPressed: () {
                              // Handle star icon tap
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
                                'Date: ${starredEventDates[index]}',
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
                              // Handle link icon tap
                              _showEventDetails(
                                  context,
                                  starredCategoryNames[index],
                                  starredEventDates[index]);
                            },
                          ),
                        ],
                      ),
                    ],
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

void _showEventDetails(
    BuildContext context, String categoryName, String eventDate) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Event Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Category: $categoryName'), // Display category name
            SizedBox(height: 8),
            Text('Date: $eventDate'), // Display event date
            SizedBox(height: 8),
            Text(
                'Description: Add your description here'), // Add your description
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
