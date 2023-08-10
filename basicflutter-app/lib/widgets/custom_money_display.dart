import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomMoneyDisplay extends StatelessWidget {
  final double amount;
  final TextStyle amountStyle;
  final TextStyle amountStyleSmall;
  final EdgeInsets? padding;
  const CustomMoneyDisplay({
    super.key,
    required this.amount,
    required this.amountStyle,
    required this.amountStyleSmall,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat.currency(
        locale: 'eu',
        customPattern: '#,### \u00a4',
        symbol: '',
        decimalDigits: 2);

    final String convertedMoneyToString = formater.format(amount);
    final splitConvertedValues = convertedMoneyToString.split(',');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: padding,
          child: Text('\$', style: amountStyleSmall),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(text: splitConvertedValues[0], style: amountStyle),
          TextSpan(text: ',${splitConvertedValues[1]}', style: amountStyleSmall)
        ])),
      ],
    );
  }
}
