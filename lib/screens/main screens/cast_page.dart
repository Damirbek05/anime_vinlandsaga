import 'package:flutter/material.dart';
import 'package:vinlandsaga_pro/widgets/cast/cast_feed.dart';
import 'package:vinlandsaga_pro/widgets/cast/cast_new.dart'; // Updated import
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../widgets/tabbar_navigation.dart';

class CastPage extends StatefulWidget {
  // ignore: use_super_parameters
  const CastPage({Key? key}) : super(key: key);

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('Cast');
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast'), // Updated title
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const AppBarNavigation(), // Replace AppBarNavigation with your desired class name
                ),
              );
            },
            icon: Icon(
              Icons.group,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10), // Add some spacing from top
            CastNew(), // Updated widget reference
            Expanded(
              child: CastFeed(),
            ),
          ],
        ),
      ),
    );
  }
}
