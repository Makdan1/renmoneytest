import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:renmoneytest/ui/widget/transaction_feed.dart';
import 'package:renmoneytest/utils/colors.dart';
import 'package:renmoneytest/utils/router/route_names.dart';
import 'package:shimmer/shimmer.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Home> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //This makes the view model accessible to the views using stacked
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {
          model.getTheme();
        },
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "All Transactions",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //Press to change to light theme
                            ElevatedButton(
                                style:  ElevatedButton.styleFrom(primary:AppColors.grey),
                                onPressed: () {
                                  model.setLightMode();
                                },
                                child: const Text("Light Theme")),
                            const SizedBox(
                              width: 10,
                            ),
                            //Press to change to dark theme

                            ElevatedButton(
                              style:  ElevatedButton.styleFrom(primary:AppColors.black),
                              onPressed: () {
                                model.setDarkMode();
                              },
                              child: const Text("Dark Theme",style: TextStyle(color: AppColors.white),),
                            ),
                          ],
                        ),
                        //The list of data from the api is displayed here
                        Expanded(
                          child: FutureBuilder<List<ClientTransaction>>(
                              future: model.transactionList(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        period: const Duration(seconds: 2),
                                        child: ListView(
                                          children: [0, 1, 2, 3, 4, 5]
                                              .map((_) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 8.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            2.0),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 8.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            2.0),
                                                              ),
                                                              Container(
                                                                width: 40.0,
                                                                height: 8.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                        baseColor: AppColors.grey,
                                        highlightColor: Colors.white),
                                  );
                                } else if (snapshot.data!.isNotEmpty) {
                                  return AnimationLimiter(
                                      child: ListView(
                                          shrinkWrap: true,
                                          children: snapshot.data!
                                              .map((feed) => AnimationConfiguration
                                                  .staggeredList(
                                                      position: 1,
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                      child: SlideAnimation(
                                                          verticalOffset: 50.0,
                                                          child: FadeInAnimation(
                                                              child: TransactionsFeed(
                                                            clientTransactionDetails:
                                                                feed,
                                                            onPressed: () {
                                                              _navigationService
                                                                  .navigateTo(
                                                                      transactionDetailsRoute,
                                                                      arguments:
                                                                          feed);
                                                            },
                                                          )))))
                                              .toList()));
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Column(
                                    children: const <Widget>[
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        'Network error',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Network error'),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ));
                                } else {
                                  return Center(
                                      child: Column(
                                    children: const <Widget>[
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        'No transaction yet',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Once a transaction is made it will display here',
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ));
                                }
                              }),
                        ),
                      ])));
        });
  }
}
