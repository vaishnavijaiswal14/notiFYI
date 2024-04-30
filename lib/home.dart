//home
import 'package:flutter/material.dart';
import 'package:my_notifyi/login.dart';
import 'package:my_notifyi/settings.dart';
import 'starred.dart';
import 'package:my_notifyi/placement.dart';
import 'package:my_notifyi/Btech.dart';
import 'package:my_notifyi/banasthali.dart';  // Import the StarredImagesPage

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  late String userEmail; //#
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSearching = false;
  List<bool> _starredEvents = List.filled(7, false); // List to track starred events

  final List<String> imageUrls = [
    'assets/no.jpeg',
    'assets/n.jpeg',
    'assets/ni.jpeg',
    'assets/noti.jpeg',
    'assets/notic.jpeg',
    'assets/notice.jpeg',
    'assets/not.jpeg',
  ];

  // Sample event dates
  List<String> eventDates = [
    '02-04-2024', '28-03-2024', '27-03-2024',
    '20-03-2024', '18-03-2024', '18-03-2024',
    '15-03-2024'
  ];

  // Sample category names
  List<String> categoryNames = [
    'Placement Cell', 'B.Tech', 'B.Tech',
    'Banasthali (University Level)', 'Banasthali(Univeristy Level)', 'Placement Cell',
    'B.Tech'
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments != null && arguments.containsKey('email')) {
      userEmail = arguments['email'] as String;
    } else {
      // Handle case when email is not passed
      // For example, redirect to login page
      return Login();
    }
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
          children:  [
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Banasthali (University Level)'),
              // ... (onTap for navigation)
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Bnsthli()));
              }
            ),
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
               onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Btech())); // Close Drawer
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
              padding: EdgeInsets.all(3.0), // Reduced padding for GridView
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imageUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        SizedBox(height: 4), // Reduced space for event name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _toggleStarred(index);
                              },
                              child: Icon(
                                _starredEvents[index] ? Icons.star : Icons.star_border,
                                color: _starredEvents[index] ? Colors.blue : Colors.black,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Event Name ${index + 1}', // Replace with actual event name
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4), // Spacing between event name and link icon
                            GestureDetector(
                              onTap: () {
                                _showEventDetails(index);
                              },
                              child: Icon(
                                Icons.link,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4), // Spacing between event name and date
                        Text(
                          'Date: ${eventDates[index]}', // Displaying event date
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
            // ... (display images with descriptions and event dates)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Implement action for camera icon
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.star),
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
              icon: Icon(Icons.settings),
              onPressed: () {
                // Implement action for settings icon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage(
      email: userEmail
    ),
  ),
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
        return AlertDialog(
          title: Text('Event Name ${index + 1}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Category: ${categoryNames[index]}'), // Display category name
              SizedBox(height: 8),
              Text('Date: ${eventDates[index]}'), // Display event date
              SizedBox(height: 8),
              Text('Description: Add your description here'), // Add your description
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
