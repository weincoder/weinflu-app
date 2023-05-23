import 'package:weinflu_app/design/colors.dart';

import 'custom_money_display.dart';
import 'package:flutter/material.dart';

enum TypeTransaction { positive, negative }

class TransactionDetail {
  final String movementName;
  final String transactionDate;
  final TypeTransaction typeTransaction;
  final double amount;
  TransactionDetail(
      {required this.movementName,
      required this.transactionDate,
      required this.typeTransaction,
      required this.amount});
}

class TransactionDetailByMonth {
  final String month;
  final List<TransactionDetailByDayModel> listofTransactions;
  TransactionDetailByMonth(
      {required this.month, required this.listofTransactions});
}

class TransactionDetailByDayModel {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> listofTransactions;
  TransactionDetailByDayModel(
      {required this.day,
      required this.dayNumber,
      required this.isToday,
      required this.listofTransactions});
}

class TransactionDetailByDay extends StatelessWidget {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> listofTransactions;
  const TransactionDetailByDay(
      {super.key,
      required this.listofTransactions,
      required this.day,
      required this.isToday,
      required this.dayNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                day,
              ),
              Text(dayNumber.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isToday ? FontWeight.bold : FontWeight.normal)),
              isToday
                  ? const Icon(
                      Icons.lens,
                      size: 8,
                      color: WeinFluColors.brandOnSuccessColor,
                    )
                  : const SizedBox(
                      height: 8,
                      width: 8,
                    )
            ],
          ),
        ),
        Container(
          width: 340,
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: WeinFluColors.brandLightColor,
              borderRadius: BorderRadius.circular(12)),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, indice) {
                print('vamos en la transaccion $indice');
                return listofTransactions[indice].typeTransaction ==
                        TypeTransaction.positive
                    ? TransactionDetailPositive(
                        transactionDetail: listofTransactions[indice])
                    : TransactionDetailNegative(
                        transactionDetail: listofTransactions[indice]);
              },
              separatorBuilder: (context, indice) => const Divider(
                    color: WeinFluColors.brandSecondaryColor,
                    thickness: 2,
                  ),
              itemCount: listofTransactions.length),
        )
      ],
    );
  }
}

class TransactionDetailPositive extends StatelessWidget {
  final TransactionDetail transactionDetail;
  const TransactionDetailPositive({super.key, required this.transactionDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: WeinFluColors.brandSuccessColor),
          child: const Icon(
            Icons.expand_less,
            color: WeinFluColors.brandOnSuccessColor,
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                    color: WeinFluColors.brandDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                    fontSize: 10, color: WeinFluColors.brandLigthDarkColor),
              ),
            ],
          ),
        ),
        Expanded(
            child: CustomMoneyDisplay(
          margin: const EdgeInsets.only(top: 7),
          leftSimbol: const Text(
            ' \$ ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: WeinFluColors.brandDarkColor,
                fontSize: 13),
          ),
          amount: transactionDetail.amount,
          amountStyle: const TextStyle(
              color: WeinFluColors.brandDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: 13),
          amountStyleSmall: const TextStyle(
              fontWeight: FontWeight.bold,
              color: WeinFluColors.brandDarkColor,
              fontSize: 10),
        )),
      ],
    );
  }
}

class TransactionDetailNegative extends StatelessWidget {
  final TransactionDetail transactionDetail;
  const TransactionDetailNegative({super.key, required this.transactionDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: WeinFluColors.brandErrorColor),
          child: const Icon(
            Icons.expand_more,
            color: WeinFluColors.brandOnErrorColor,
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                    color: WeinFluColors.brandDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                    fontSize: 10, color: WeinFluColors.brandLigthDarkColor),
              ),
            ],
          ),
        ),
        Expanded(
            child: CustomMoneyDisplay(
          margin: const EdgeInsets.only(top: 7),
          amount: transactionDetail.amount,
          amountStyle: const TextStyle(
              color: WeinFluColors.brandOnErrorColor,
              fontWeight: FontWeight.bold,
              fontSize: 13),
          leftSimbol: const Text(
            '-\$ ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: WeinFluColors.brandOnErrorColor,
                fontSize: 13),
          ),
          amountStyleSmall: const TextStyle(
              fontWeight: FontWeight.bold,
              color: WeinFluColors.brandOnErrorColor,
              fontSize: 10),
        )),
      ],
    );
  }
}
