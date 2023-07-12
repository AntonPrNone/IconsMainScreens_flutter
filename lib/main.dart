// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const List<Color> _colors = Colors.primaries;

  final double _iconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: MyAppBar(title: "Home Screen"),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: icons.length,
              itemBuilder: (context, index) {
                final randomColor = _colors[Random().nextInt(_colors.length)];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: GestureDetector(
                    onTapDown: (details) {
                      _showPressedIconDialog(context, icons[index].icon);
                    },
                    child: Container(
                      color: randomColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index].icon,
                            size: _iconSize,
                            color: Colors.black,
                          ),
                          Flexible(
                            child: Text(
                              icons[index].displayName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showPressedIconDialog(BuildContext context, IconData icon) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                width: 100.0,
                height: 100.0,
                child: Icon(
                  icon,
                  size: 50.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class IconInfo {
  final IconData icon;
  final String displayName;

  IconInfo({required this.icon, required this.displayName});
}

final List<IconInfo> icons = [
  IconInfo(icon: Icons.access_alarm, displayName: "Access Alarm"),
  IconInfo(icon: Icons.accessibility, displayName: "Accessibility"),
  IconInfo(icon: Icons.add, displayName: "Add"),
  IconInfo(icon: Icons.airline_seat_flat, displayName: "Airline Seat Flat"),
  IconInfo(icon: Icons.airport_shuttle, displayName: "Airport Shuttle"),
  IconInfo(icon: Icons.android, displayName: "Android"),
  IconInfo(icon: Icons.apps, displayName: "Apps"),
  IconInfo(icon: Icons.attach_money, displayName: "Attach Money"),
  IconInfo(icon: Icons.audiotrack, displayName: "Audiotrack"),
  IconInfo(icon: Icons.backup, displayName: "Backup"),
  IconInfo(icon: Icons.battery_alert, displayName: "Battery Alert"),
  IconInfo(icon: Icons.beach_access, displayName: "Beach Access"),
  IconInfo(icon: Icons.beenhere, displayName: "Beenhere"),
  IconInfo(icon: Icons.bluetooth, displayName: "Bluetooth"),
  IconInfo(icon: Icons.book, displayName: "Book"),
  IconInfo(icon: Icons.border_all, displayName: "Border All"),
  IconInfo(icon: Icons.cake, displayName: "Cake"),
  IconInfo(icon: Icons.calendar_today, displayName: "Calendar Today"),
  IconInfo(icon: Icons.camera_alt, displayName: "Camera Alt"),
  IconInfo(icon: Icons.check, displayName: "Check"),
  IconInfo(icon: Icons.child_care, displayName: "Child Care"),
  IconInfo(icon: Icons.content_copy, displayName: "Content Copy"),
  IconInfo(icon: Icons.create, displayName: "Create"),
  IconInfo(icon: Icons.delete, displayName: "Delete"),
];

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Color.fromARGB(255, 54, 23, 109),
          ],
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 50.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
