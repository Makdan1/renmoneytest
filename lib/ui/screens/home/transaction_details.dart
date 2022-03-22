import 'package:intl/intl.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:renmoneytest/utils/colors.dart';
import 'package:renmoneytest/utils/screensize.dart';
import 'package:stacked/stacked.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';

class TransactionDetails extends StatefulWidget {
  final ClientTransaction clientTransaction;
  const TransactionDetails({Key? key, required this.clientTransaction})
      : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<TransactionDetails> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
  }
// This screen displays the the transaction details from the list
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor.withOpacity(0.7),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            _navigationService.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Transaction details",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 350,
                            width: Responsive.width(context),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Detailed summary of transaction",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Recipient ID",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      widget.clientTransaction.transactionId
                                          .toString(),
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "\u20A6" +
                                          widget.clientTransaction.amount
                                              .toString(),
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Transaction date",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      DateFormat(
                                        "dd MMM. yyyy",
                                      )
                                          .format(DateTime.parse(widget
                                              .clientTransaction.entryDate!))
                                          .toString(),
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Reference",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      widget.clientTransaction.transactionId
                                          .toString(),
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Status",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: AppColors.green,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Successful",
                                          style: TextStyle(
                                              color: AppColors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ))
                      ])));
        });
  }
}
