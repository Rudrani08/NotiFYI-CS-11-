import 'package:flutter/material.dart';

class StarredImagesPage extends StatelessWidget {
  final List<bool> starredEvents;
  final List<String> imageUrls;
  final List<String> eventDates;
  final List<String> categoryNames;

  StarredImagesPage({
    required this.starredEvents,
    required this.imageUrls,
    required this.eventDates,
    required this.categoryNames,
  });

  @override
  Widget build(BuildContext context) {
    List<String> starredUrls = [];
    List<String> starredEventDates = [];
    List<String> starredCategoryNames = [];

    // Filtering the starred events
    for (int i = 0; i < starredEvents.length; i++) {
      if (starredEvents[i]) {
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

            // GridView block
            Padding(
              padding: EdgeInsets.all(3.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: starredUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _showEventDetails(
                        context,
                        starredCategoryNames[index],
                        starredEventDates[index],
                      );
                    },
                    child: Column(
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
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Event Name ${index + 1}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.link,
                              color: Colors.blue,
                            ),
                          ],
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
              Text('Category: $categoryName'),
              SizedBox(height: 8),
              Text('Date: $eventDate'),
              SizedBox(height: 8),
              Text('Description: Add your description here'),
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
}
