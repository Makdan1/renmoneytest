import 'package:intl/intl.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:flutter/material.dart';
import 'package:renmoneytest/utils/colors.dart';

// This is the item widget for the transaction access
class TransactionsFeed extends StatelessWidget {
  final ClientTransaction clientTransactionDetails;
  final Function onPressed;
  TransactionsFeed(
      {required this.onPressed, required this.clientTransactionDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
            height: 120,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 35,
                    backgroundColor: clientTransactionDetails.type == "DEPOSIT"
                        ? AppColors.depositColor.withOpacity(0.1)
                        : AppColors.transferColor.withOpacity(0.1),
                    child: Icon(
                      clientTransactionDetails.type == "DEPOSIT"
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: clientTransactionDetails.type == "DEPOSIT"
                          ? AppColors.depositColor
                          : AppColors.transferColor,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientTransactionDetails.comment != null
                          ? clientTransactionDetails.comment!
                          : "Not comment",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat(
                        "dd MMM. yyyy",
                      )
                          .format(DateTime.parse(
                              clientTransactionDetails.entryDate!))
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "\u20A6" + clientTransactionDetails.amount.toString(),
                  style: TextStyle(
                      color: clientTransactionDetails.type == "DEPOSIT"
                          ? AppColors.moneyDepositColor
                          : AppColors.airtimeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )));
  }
}
