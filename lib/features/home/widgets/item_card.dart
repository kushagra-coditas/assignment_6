import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/features/home/providers/home_notifier.dart';
import 'package:assignment_6/features/models/item_model.dart';

class ItemCard extends ConsumerWidget {
  final FoodModel food;

  final VoidCallback onTap;

  ItemCard({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xffE9F3FB)),
        boxShadow: [BoxShadow(color: Colors.grey.shade100)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              child: Center(
                child: Image(image: AssetImage(food.image), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            food.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Per Plate \$${food.price}",
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
