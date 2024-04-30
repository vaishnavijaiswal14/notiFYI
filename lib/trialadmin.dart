// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:my_notifyi/admin_settings.dart';
// import 'package:my_notifyi/admin_starred.dart';
// import 'package:my_notifyi/Btech.dart';
// import 'package:my_notifyi/banasthali.dart';
// import 'package:my_notifyi/placement.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'NotiFYI',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool _isSearching = false;
//   Uint8List? _imageBytes;
//   List<String> imageUrls = [
//     'assets/n.jpeg',
//     'assets/no.jpeg',
//     'assets/meme_notice.jpeg',
//     'assets/noti.jpeg',
//     'assets/notic.jpeg',
//     'assets/notice.jpeg',
//     'assets/not.jpeg',
//   ];
//   List<String> pdfUrls = [
//     'assets/example.pdf'
//   ];
//   List<String> eventDates = [
//     '02-04-2024',
//     '28-03-2024',
//     '27-03-2024',
//     '20-03-2024',
//     '18-03-2024',
//     '18-03-2024',
//     '15-03-2024'
//   ];
//   List<String> categoryNames = [
//     'Placement Cell',
//     'B.Tech',
//     'B.Tech',
//     'Banasthali (University Level)',
//     'Banasthali(Univeristy Level)',
//     'Placement Cell',
//     'B.Tech'
//   ];
//   Set<int> starredEvents = Set();

//   void _setImage(Uint8List bytes) {
//     if (mounted) {
//       setState(() {
//         _imageBytes = bytes;
//       });
//     }
//   }

//   void addEvent(String imageUrl, String eventDate, String eventName,
//       String eventDescription,
//       {bool isStarred = false}) {
//     setState(() {
//       imageUrls.add(imageUrl);
//       eventDates.add(eventDate);
//       if (isStarred) {
//         starredEvents.add(imageUrls.length - 1);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: _isSearching
//             ? const TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search notices',
//                   hintStyle: TextStyle(color: Colors.white),
//                   iconColor: Colors.white,
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               )
//             : const Text('Notices', style: TextStyle(color: Colors.white)),
//         backgroundColor: Color.fromARGB(255, 22, 25, 149),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () => setState(() => _isSearching = !_isSearching),
//             icon: Icon(_isSearching ? Icons.close : Icons.search),
//             color: Colors.white,
//           ),
//           IconButton(
//             onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
//             icon: const Icon(Icons.menu),
//             color: Colors.white,
//           ),
//         ],
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//                 leading: Icon(Icons.school),
//                 title: Text('Banasthali (University Level)'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Bnsthli()));
//                 }),
//             ListTile(
//               leading: Icon(Icons.work),
//               title: Text('Placement Cell'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Placement()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.computer),
//               title: Text('B.Tech'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Btech()));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(4.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: imageUrls.length + pdfUrls.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 4.0,
//                   mainAxisSpacing: 4.0,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   bool isStarred = starredEvents.contains(index);
//                   if (index < imageUrls.length) {
//                     return GestureDetector(
//                       onTap: () {
//                         _openDetailPage(index);
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 200,
//                             child: Image.network(
//                               imageUrls[index],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   isStarred ? Icons.star : Icons.star_border,
//                                   color: isStarred
//                                       ? Color.fromARGB(255, 33, 150, 243)
//                                       : null,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     if (isStarred) {
//                                       starredEvents.remove(index);
//                                     } else {
//                                       starredEvents.add(index);
//                                     }
//                                   });
//                                 },
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Event Name ${index + 1}',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     'Date: ${eventDates[index]}',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.link),
//                                 color: Colors.blue,
//                                 onPressed: () {
//                                   _showEventDetails(context, index);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   } else {
//                     // Display PDF icons
//                     int pdfIndex = index - imageUrls.length;
//                     return GestureDetector(
//                       onTap: () {
//                         _openPdf(pdfUrls[pdfIndex]);
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 200,
//                             child: Icon(
//                               Icons.picture_as_pdf,
//                               size: 100,
//                               color: Colors.red, // PDF icon color
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'PDF Document ${pdfIndex + 1}',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Color.fromARGB(255, 22, 25, 149),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) =>
//                 EventFormScreen(setImage: _setImage, addEvent: addEvent),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.star),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => StarredImagesAdminPage(
//                       imageUrls: imageUrls,
//                       eventDates: eventDates,
//                       categoryNames: categoryNames,
//                       starredEvents: starredEvents,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showEventDetails(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Event Details'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Category: ${categoryNames[index]}'),
//               Text('Event Name: Event Name ${index + 1}'),
//               SizedBox(height: 8),
//               Text('Event Date: Date ${index + 1}'),
//               SizedBox(height: 8),
//               Text('Event Description: Description ${index + 1}'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _openDetailPage(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 480,
//                 child: Image.network(
//                   imageUrls[index],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Event Name ${index + 1}',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Date: ${eventDates[index]}',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//               SizedBox(height: 8),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Close'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _openPdf(String pdfUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PdfViewScreen(pdfUrl: pdfUrl),
//       ),
//     );
//   }
// }

// class EventFormScreen extends StatefulWidget {
//   final void Function(Uint8List) setImage;
//   final void Function(String, String, String, String, {bool isStarred})
//       addEvent;

//   EventFormScreen({required this.setImage, required this.addEvent});

//   @override
//   _EventFormScreenState createState() => _EventFormScreenState();
// }

// class _EventFormScreenState extends State<EventFormScreen> {
//   late TextEditingController _eventNameController;
//   late TextEditingController _eventDescriptionController;
//   late DateTime _eventDate;
//   File? _imageFile;
//   File? _pdfFile;
//   String _selectedCategory = 'Category A';

//   @override
//   void initState() {
//     super.initState();
//     _eventNameController = TextEditingController();
//     _eventDescriptionController = TextEditingController();
//     _eventDate = DateTime.now();
//   }

//   @override
//   void dispose() {
//     _eventNameController.dispose();
//     _eventDescriptionController.dispose();
//     super.dispose();
//   }

//   void _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final bytes = await pickedFile.readAsBytes();
//       widget.setImage(Uint8List.fromList(bytes));
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   void _pickPdf() async {
//     final pickedFile =
//         await ImagePicker().pickFiles(allowedExtensions: ['pdf']);
//     if (pickedFile != null && pickedFile.isNotEmpty) {
//       setState(() {
//         _pdfFile = File(pickedFile.first.path!);
//       });
//     }
//   }

//   void _submitForm() {
//     String imageUrl = _imageFile != null ? _imageFile!.path : '';
//     String pdfUrl = _pdfFile != null ? _pdfFile!.path : '';
//     String eventDate =
//         '${_eventDate.day}-${_eventDate.month}-${_eventDate.year}';
//     String eventName = _eventNameController.text.trim();
//     String eventDescription = _eventDescriptionController.text.trim();

//     widget.addEvent(
//       imageUrl,
//       pdfUrl,
//       eventDate,
//       eventName,
//       // eventDescription,
//     );

//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             SizedBox(height: 16),
//             TextField(
//               controller: _eventNameController,
//               decoration: InputDecoration(
//                 labelText: 'Event Name',
//                 labelStyle: TextStyle(fontSize: 16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _eventDescriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Event Description',
//                 labelStyle: TextStyle(fontSize: 16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Text(
//                   'Category:',
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(width: 16),
//                 Radio<String>(
//                   value: 'Category A',
//                   groupValue: _selectedCategory,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value!;
//                     });
//                   },
//                 ),
//                 Text('Category A'),
//                 SizedBox(width: 16),
//                 Radio<String>(
//                   value: 'Category B',
//                   groupValue: _selectedCategory,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value!;
//                     });
//                   },
//                 ),
//                 Text('Category B'),
//                 SizedBox(width: 16),
//                 Radio<String>(
//                   value: 'Category C',
//                   groupValue: _selectedCategory,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value!;
//                     });
//                   },
//                 ),
//                 Text('Category C'),
//               ],
//             ),
//             SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text(
//                 'Attach Image',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             SizedBox(height: 12),
//             if (_imageFile != null && _imageFile!.path.isNotEmpty)
//               kIsWeb
//                   ? Image.network(
//                       _imageFile!.path,
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     )
//                   : Image.file(
//                       _imageFile!,
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//             SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: _pickPdf,
//               child: Text(
//                 'Attach PDF',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             SizedBox(height: 12),
//             if (_pdfFile != null && _pdfFile!.path.isNotEmpty)
//               Text(
//                 'Selected PDF: ${_pdfFile!.path}',
//                 style: TextStyle(fontSize: 14),
//               ),
//             SizedBox(height: 12),
//             Row(
//               children: [
//                 Text(
//                   'Event Date:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(width: 16),
//                 TextButton(
//                   onPressed: () async {
//                     final selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2023),
//                       lastDate: DateTime(2025),
//                     );
//                     if (selectedDate != null) {
//                       setState(() {
//                         _eventDate = selectedDate;
//                       });
//                     }
//                   },
//                   child: Text(
//                     '${_eventDate.day}/${_eventDate.month}/${_eventDate.year}',
//                     style: TextStyle(color: Colors.blue, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _submitForm,
//               child: Text(
//                 'Submit',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PdfViewScreen extends StatelessWidget {
//   final String pdfUrl;

//   PdfViewScreen({required this.pdfUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PDFView(
//         filePath: pdfUrl,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: false,
//         pageSnap: false,
//         defaultPage: 0,
//         fitPolicy: FitPolicy.WIDTH,
//         preventLinkNavigation: false,
//         onRender: (pages) {
//           print('PDF Pages: $pages');
//         },
//         onError: (error) {
//           print(error.toString());
//         },
//         onPageError: (page, error) {
//           print('Error on page $page: $error');
//         },
//         onViewCreated: (PDFViewController pdfViewController) {
//           // Add controller logic here
//         },
//         onLinkHandler: (String? uri) {
//           // Handle links here
//         },
//         onPageChanged: (int page, int total) {
//           print('Page $page of $total');
//         },
//       ),
//     );
//   }
// }
