import 'package:assignment_6/features/home/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:assignment_6/features/home/screen/home_screen.dart';

class PreparingFoodScreen extends StatelessWidget {
  const PreparingFoodScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("lib/assets/images/preparing_food.png"),
              SizedBox(height: 10),
              Text(
                "Chef is preparing your food...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(31, 25, 112, 1),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 200,
                child: Text(
                  "Please do some stretching until chef is cooking your food..",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(31, 25, 112, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipPath(
          clipper: TrapeziumClipper(),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Back to",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(31, 25, 112, 1),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.home,
                        color: Color.fromRGBO(31, 25, 112, 1),
                      ),
                    ),
                  ],
                ),

                ClipPath(
                  clipper: TrapeziumClipper(),
                  child: Material(
                    color: const Color(0xFF1F1970),
                    child: InkWell(
                      onTap: () {},

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Text(
                          "Track Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
