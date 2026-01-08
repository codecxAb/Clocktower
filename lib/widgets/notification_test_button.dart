import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationTestButton extends StatelessWidget {
  const NotificationTestButton({super.key});

  Future<void> _testNotification() async {
    // Schedule a test notification for 10 seconds from now
    final testTime = DateTime.now().add(const Duration(seconds: 10));

    await NotificationService.scheduleNotification(
      id: 999999,
      title: 'Test Notification',
      body: 'If you see this, notifications are working!',
      scheduledTime: testTime,
    );

    print('Test notification scheduled for: $testTime');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _testNotification,
      child: const Text('Test Notification (10s)'),
    );
  }
}
