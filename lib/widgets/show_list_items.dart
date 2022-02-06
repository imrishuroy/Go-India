import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_india/models/deal.dart';
import 'package:go_india/screens/home/widgets/one_deal_card.dart';

class ShowListItems extends StatelessWidget {
  final List<Deal?> deals;

  const ShowListItems({
    Key? key,
    required this.deals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: deals.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: OneDealCard(
                  deal: deals[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
