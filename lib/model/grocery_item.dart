import 'package:flutter/painting.dart';

// 1
enum Importance { low, medium, high }

class GroceryItem {
  // 2
  final String? id;
  // 3
  final String? name;
  final Importance? importance;
  final Color? color;
  final int? quantity;
  final DateTime? date;
  final bool isComplete;

  GroceryItem(
      {this.id,
      this.name,
      this.importance,
      this.color,
      this.quantity,
      this.date,
      this.isComplete = false});

  // 4

}
