import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/features/orders/widgets/orders_widgets.dart';
import 'package:assignment_6/features/orders/providers/orders_providers.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider);

    final itemTotal = order.riceQuantity * 30 + order.vegQuantity * 18;
    const deliveryFee = 1;
    const tax = 1;
    final total = itemTotal + deliveryFee + tax;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.deepPurple),

        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_offer, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Apply Coupon"),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            FoodItemRow(
              title: "Rice & Bread",
              subtitle: "Per Plate \$30",
              price: order.riceQuantity * 30,
              quantity: order.riceQuantity,
              onIncrement: () =>
                  ref.read(orderProvider.notifier).incrementRice(),
              onDecrement: () =>
                  ref.read(orderProvider.notifier).decrementRice(),
            ),
            const SizedBox(height: 12),
            FoodItemRow(
              title: "Herby Veg",
              subtitle: "Per Plate \$18",
              price: order.vegQuantity * 18,
              quantity: order.vegQuantity,
              onIncrement: () =>
                  ref.read(orderProvider.notifier).incrementVeg(),
              onDecrement: () =>
                  ref.read(orderProvider.notifier).decrementVeg(),
            ),

            Divider(height: 32),

            PriceRow(text: "Item Total", value: "\$$itemTotal"),
            PriceRow(text: "Delivery Fee", value: "\$1"),
            PriceRow(text: "Tax and charges", value: "\$1"),

            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "To Pay",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$$total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Spacer(),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Office",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "2142 Downwood Ave undefined",
                    style: TextStyle(color: Colors.black54),
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.red),
                          SizedBox(width: 6),
                          Text("Master Card **** 4035"),
                        ],
                      ),
                      RoundedButton(
                        text: "Pay Now",
                        onPressed: () {},
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
