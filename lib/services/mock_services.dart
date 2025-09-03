// services/mock_services.dart
import 'package:flutter/material.dart';

class MockCleanupService {
  List<Map<String, dynamic>> getCleanupItems() {
    return [
      {
        'title': 'อีเมลขยะและสแปม',
        'count': 247,
        'size': '45.2 MB',
        'co2': '0.8 kg',
        'points': 25,
        'icon': Icons.email,
        'color': Colors.red,
      },
      {
        'title': 'รูปภาพซ้ำและเบลอ',
        'count': 89,
        'size': '156.7 MB',
        'co2': '1.2 kg',
        'points': 40,
        'icon': Icons.photo_library,
        'color': Colors.purple,
      },
      {
        'title': 'วิดีโอเก่าที่ไม่ใช้',
        'count': 12,
        'size': '2.1 GB',
        'co2': '3.5 kg',
        'points': 60,
        'icon': Icons.videocam,
        'color': Colors.blue,
      },
      {
        'title': 'ไฟล์แคชและชั่วคราว',
        'count': 1250,
        'size': '89.3 MB',
        'co2': '0.5 kg',
        'points': 15,
        'icon': Icons.cached,
        'color': Colors.orange,
      },
      {
        'title': 'เอกสารซ้ำ',
        'count': 34,
        'size': '23.4 MB',
        'co2': '0.3 kg',
        'points': 10,
        'icon': Icons.description,
        'color': Colors.teal,
      },
    ];
  }

  Future<void> cleanupItems(List<String> categories) async {
    // Simulate cleanup process
    await Future.delayed(Duration(seconds: 2));
  }
}