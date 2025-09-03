// models/cleanup_task.dart
import 'package:flutter/material.dart';

class CleanupTask {
  final String title;
  final String description;
  final IconData icon;
  final String estimatedImpact;
  final int points;
  final Color color;

  CleanupTask({
    required this.title,
    required this.description,
    required this.icon,
    required this.estimatedImpact,
    required this.points,
    required this.color,
  });
}