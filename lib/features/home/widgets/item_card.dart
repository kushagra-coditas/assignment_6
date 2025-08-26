// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_6/features/home/providers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:assignment_6/features/models/item_model.dart';

class ItemCard extends ConsumerWidget {
  final FoodModel food;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  ItemCard({
    required this.food,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final notifier = ref.watch(foodProvider.notifier);
    final isSelected = notifier.isSelected(index);
    return GestureDetector(
      onTap: () {
        ref.read(foodProvider.notifier).toggleItemSelection(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: isSelected
              ? Border.all(color: Colors.green)
              : Border.all(color: Colors.grey),
          boxShadow: [BoxShadow(color: Colors.grey.shade100)],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(food.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  food.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Per Plate \$${food.price}",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
              ],
            ),

            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.check, color: Colors.white, size: 18),
                ),
              ),
          ],
        ),
        
        
      ),
      
    );
    
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0); 
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

