import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/design/radius.dart';
import 'package:weinflu_app/mocks/transactions_mock.dart';
import 'package:weinflu_app/widgets/divider_with_text.dart';
import 'package:weinflu_app/widgets/transaction_detail.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeinFluColors.brandLightBackgroundColor,
      appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: false,
          leadingWidth: 56,
          toolbarHeight: 97,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: WeinFluRadius.small,
                  bottomRight: WeinFluRadius.small)),
          backgroundColor: WeinFluColors.brandLightColor,
          leading: Container(
            margin: const EdgeInsets.fromLTRB(16, 45, 0, 12),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(color: WeinFluColors.brandLightColorBorder),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: WeinFluColors.brandPrimaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 45, 16, 12),
            child: Text(
              WeinfluCopys.recenTrx,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              height: 56,
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: TransactionsMocks.categories.length,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    onPressed: () {},
                    height: 35,
                    minWidth: 35,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: index == 0
                        ? WeinFluColors.brandPrimaryColor
                        : WeinFluColors.brandLightColor,
                    child: Text(
                      TransactionsMocks.categories[index],
                      style: TextStyle(
                          fontSize: 12,
                          color: index != 0
                              ? WeinFluColors.brandPrimaryColor
                              : WeinFluColors.brandLightColor),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16,
                ),
              )),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                  itemBuilder: (contex, month) {
                    var dataPerMonth =
                        TransactionsMocks.transactionDetailByMonth[month];
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (contex, day) {
                            var dataPerDay =
                                dataPerMonth.listofTransactions[day];
                            return TransactionDetailByDay(
                              day: dataPerDay.day,
                              isToday: dataPerDay.isToday,
                              dayNumber: dataPerDay.dayNumber,
                              listofTransactions: dataPerDay.listofTransactions,
                            );
                          },
                          separatorBuilder: (contex, day) => const SizedBox(
                                height: 24,
                              ),
                          itemCount: dataPerMonth.listofTransactions.length),
                    );
                  },
                  separatorBuilder: (context, month) {
                    print(month+1);
                    print(TransactionsMocks
                              .transactionDetailByMonth[month + 1].month);
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DividerWithText(
                          title: TransactionsMocks
                              .transactionDetailByMonth[month + 1].month),
                    );
                  },
                  itemCount: TransactionsMocks.transactionDetailByMonth.length),
            ),
          )
        ],
      ),
    );
  }
}
