import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/ui/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:renmoneytest/ui/screens/home/transaction_details.dart';
import 'package:renmoneytest/utils/router/route_names.dart';

// Setup navigators to their screens
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Home(),
      );

    case transactionDetailsRoute:
      ClientTransaction clientTransaction = settings.arguments as ClientTransaction;

      return _getPageRoute(
        routeName: settings.name!,
        viewToShow:  TransactionDetails(clientTransaction: clientTransaction,),
      );




    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
