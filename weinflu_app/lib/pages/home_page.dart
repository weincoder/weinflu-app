import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/widgets/header_title.dart';
import 'package:weinflu_app/widgets/product_detail.dart';
import 'package:weinflu_app/widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentDisplayDetailWidget = const CategoriesWidget();
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: WeinFluColors.brandLightColor,
      shadowColor: WeinFluColors.brandLightColor);
  var buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: WeinFluColors.brandSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ));
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionsBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionsBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeinFluColors.brandLightColor,
      appBar: AppBar(
        toolbarHeight: 97,
        backgroundColor: WeinFluColors.brandLightColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16.0))),
        title: const Padding(
            padding: EdgeInsets.fromLTRB(16, 45, 16, 12), child: HeaderTitle()),
      ),
      body: Column(
        children: [
          Container(
            height: 360,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 69, bottom: 16),
            transform: Matrix4.translationValues(0, -13, 0),
            decoration: const BoxDecoration(
                color: WeinFluColors.brandPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your Budget',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 10, right: 4),
                        child: Text('\$',
                            style: Theme.of(context).textTheme.displaySmall)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '2.868.000',
                              style: Theme.of(context).textTheme.displayLarge),
                          TextSpan(
                              text: ',00',
                              style: Theme.of(context).textTheme.displayMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SummaryCard(
                  typeSummaryCard: TypeSummaryCard.incomes,
                  amount: '700.000',
                  period: 'From January 1 to January 31',
                ),
                const SummaryCard(
                  typeSummaryCard: TypeSummaryCard.outcomes,
                  amount: '90.000',
                  period: 'From January 1 to January 31',
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 104,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: WeinFluColors.brandLightColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: categorieBtnStyle,
                      onPressed: () {
                        setState(() {
                          currentDisplayDetailWidget = const CategoriesWidget();
                          categorieBtnStyle = buttonStyleActive;
                          recentTransactionsBtnStyle = buttonStyleInactive;
                        });
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              color: WeinFluColors.brandDarkColor,
                              fontSize: 14),
                        ),
                      )),
                  ElevatedButton(
                      style: recentTransactionsBtnStyle,
                      onPressed: () {
                        setState(() {
                          currentDisplayDetailWidget =
                              const RecentTransactions();
                          categorieBtnStyle = buttonStyleInactive;
                          recentTransactionsBtnStyle = buttonStyleActive;
                        });
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        child: Text(
                          'Recent transaction',
                          style: TextStyle(
                              color: WeinFluColors.brandLigthDarkColor,
                              fontSize: 14),
                        ),
                      )),
                ],
              )),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: WeinFluColors.brandSecondaryColor,
                ),
                child: currentDisplayDetailWidget),
          )
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          child: const Text(
            'View All',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 97, 254, 1)),
          ),
          onPressed: () {
            print('le diste clic a view all');
          },
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: '391.254',
          amountDecimals: '01',
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          pathToProductImage: 'assets/images/tv.png',
          amount: '3.176.254',
          amountDecimals: '01',
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          pathToProductImage: 'assets/images/health.png',
          amount: '38',
          amountDecimals: '01',
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
      ],
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Este es el reto',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
