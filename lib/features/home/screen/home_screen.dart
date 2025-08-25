import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/features/home/widgets/item_card.dart';
import 'package:assignment_6/features/home/widgets/app_bar.dart';
import 'package:assignment_6/features/home/providers/home_notifier.dart';
import 'package:assignment_6/features/home/providers/home_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox();
    final state = ref.watch(foodProvider);
    final notifier = ref.watch(foodProvider.notifier);
    final food = notifier.food;

    if (state is LoadingFood) {
      content = Center(child: CircularProgressIndicator());
    } else if (state is LoadedFood) {
      content = Expanded(
        child: GridView.builder(
          itemCount: food.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),

          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: index % 2 != 0 ? 30 : 0),
              child: ItemCard(
                food: food[index],
                onTap: () {},
                isSelected: true,
                index: index,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [Appbar(), SizedBox(height: 20), content]),
        ),
      ),
    );
  }
}
