import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

//tipos de SummaryCard
enum TypeSummaryCard { incomes, outcomes }

class SummaryCard extends StatelessWidget {
  final TypeSummaryCard typeSummaryCard;
  final String amount;
  final String period;
  const SummaryCard(
      {super.key,
      required this.typeSummaryCard,
      required this.amount,
      required this.period});

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: WeinFluColors.brandOnSuccessColor,
    );
    var spendingIcon = const Icon(Icons.arrow_downward,
        color: WeinFluColors.brandOnErrorColor);
    //
    return Container(
      height: 92,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: WeinFluColors.brandPrimaryColor)),
            child: typeSummaryCard == TypeSummaryCard.incomes
                ? incomesIcon
                : spendingIcon),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            typeSummaryCard == TypeSummaryCard.incomes ? 'Incomes' : 'Spending',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 40, top: 8.0),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 3, right: 4),
                      child: Text('\$',
                          style: Theme.of(context).textTheme.displaySmall)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: amount,
                            style: Theme.of(context).textTheme.displayMedium),
                        TextSpan(
                            text: ',00',
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  period,
                  style: const TextStyle(
                      color: WeinFluColors.brandLightColor,
                      fontFamily: 'RobotoMono',
                      fontSize: 10),
                ),
              ),
            ])),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border:
                  Border.all(color: WeinFluColors.brandLightColorBorder)),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ),
      ]),
    );
  }
}
