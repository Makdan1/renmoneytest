import 'package:flutter/material.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/core/model/error_model.dart';
import 'package:renmoneytest/core/services/transaction_service.dart';
import 'package:renmoneytest/utils/base_model.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/utils/store.dart';

class HomeViewModel extends BaseModel {
  //This get the service functions from the service class
  final TransactionService transactionService = locator<TransactionService>();

  // This get the list of data from the service class and send it to views
  Future<List<ClientTransaction>> transactionList() async {
    var result = await transactionService.getTransactionList();
    if (result is ErrorModel) {
      notifyListeners();
      throw Exception('Failed to load internet');
    }
    return result;
  }



  //Theme settings
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  late final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  themeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      // print('value read from storage: ' + value.toString());
      var themeMode = value?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }


}
