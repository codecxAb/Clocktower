import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationTestButton extends StatefulWidget {
  const NotificationTestButton({super.key});

  @override
  State<NotificationTestButton> createState() => _NotificationTestButtonState();
}

class _NotificationTestButtonState extends State<NotificationTestButton> {
  String _status = '';

  Future<void> _testImmediateNotification() async {
    setState(() => _status = 'Sending immediate notification...');

    try {
      await NotificationService.showImmediateNotification(
        id: 999998,
        title: 'Immediate Test ✅',
        body: 'If you see this, notifications work!',
      );

      setState(() => _status = 'Immediate notification sent! Did you see it?');
      print('Immediate test notification triggered');
    } catch (e) {
      setState(() => _status = 'Error: $e');
      print('Error sending immediate notification: $e');
    }
  }

  Future<void> _testScheduledNotification() async {
    setState(() => _status = 'Scheduling notification for 10 seconds...');

    final testTime = DateTime.now().add(const Duration(seconds: 10));

    try {
      await NotificationService.scheduleNotification(
        id: 999999,
        title: 'Scheduled Test ⏰',
        body: 'This was scheduled 10 seconds ago!',
        scheduledTime: testTime,
      );

      setState(
          () => _status = 'Scheduled for ${testTime.toLocal()}. Wait 10s...');
      print('Scheduled test notification for: $testTime');
    } catch (e) {
      setState(() => _status = 'Error: $e');
      print('Error scheduling notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Test notifications to diagnose the issue:',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _testImmediateNotification,
          icon: const Icon(Icons.notifications),
          label: const Text('Immediate Test'),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: _testScheduledNotification,
          icon: const Icon(Icons.schedule),
          label: const Text('Scheduled Test (10s)'),
        ),
        if (_status.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            _status,
            style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
