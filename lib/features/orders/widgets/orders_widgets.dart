import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.deepPurple,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  CounterWidget({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        circleButton("-", onDecrement),
        SizedBox(width: 8),
        Text(
          "$value",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8),
        circleButton("+", onIncrement),
      ],
    );
  }

  Widget circleButton(String symbol, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(8),
        child: Text(
          symbol,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FoodItemRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  FoodItemRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.radio_button_checked, color: Colors.green),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CounterWidget(
              value: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
            SizedBox(width: 16),
            Text(
              "\$$price",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  final String text;
  final String value;

  PriceRow({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(color: Colors.black54)),
          Text(
            value,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
