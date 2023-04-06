import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

enum TypeProductDetailCard { incomes, outcomes }

class ProductDetailCard extends StatelessWidget {
  final String pathToProductImage;
  final String amount;
  final String productName;
  final String currentSells;
  final String percentage;
  final TypeProductDetailCard typeProductDetailCard;
  final String amountDecimals;
  const ProductDetailCard(
      {super.key,
      required this.pathToProductImage,
      required this.amount,
      required this.amountDecimals,
      required this.productName,
      required this.currentSells,
      required this.percentage,
      required this.typeProductDetailCard});

  @override
  Widget build(BuildContext context) {
    var iconIncomes = const Icon(
      Icons.expand_less,
      size: 20,
      color: WeinFluColors.brandOnSuccessColor,
    );
    var iconSpending = const Icon(
      Icons.expand_more,
      size: 20,
      color: WeinFluColors.brandOnErrorColor,
    );
    var currentBgPercentageColor = WeinFluColors.brandSuccessColor;
    var currentTextPercentageColor = WeinFluColors.brandOnSuccessColor;
    var currentIcon = iconIncomes;
    if (typeProductDetailCard == TypeProductDetailCard.outcomes) {
      currentBgPercentageColor = WeinFluColors.brandErrorColor;
      currentTextPercentageColor = WeinFluColors.brandOnErrorColor;
      currentIcon = iconSpending;
    }
    return Container(
      margin: const EdgeInsets.only(
        top: 14,
      ),
      height: 111,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 79,
            width: 56,
            decoration: const BoxDecoration(
              color: WeinFluColors.brandSecondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(pathToProductImage))),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: WeinFluColors.brandDarkColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoMono',
                        fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      '+ \$ $currentSells Today',
                      style: const TextStyle(
                          color: WeinFluColors.brandLigthDarkColor,
                          fontFamily: 'RobotoMono',
                          fontSize: 10),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 3, right: 4),
                          child: const Text('\$',
                              style: TextStyle(
                                  color: WeinFluColors.brandPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10))),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: amount,
                                style: const TextStyle(
                                    color: WeinFluColors.brandPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            TextSpan(
                                text: ',$amountDecimals',
                                style: const TextStyle(
                                    color: WeinFluColors.brandPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 70,
              right: 16,
            ),
            height: 19,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                color: currentBgPercentageColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currentIcon,
                Text(
                  '$percentage %',
                  style: TextStyle(
                      fontSize: 10, color: currentTextPercentageColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
