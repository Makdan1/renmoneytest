import 'package:flutter/material.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/core/model/error_model.dart';
import 'package:renmoneytest/core/services/color_preference.dart';
import 'package:renmoneytest/core/services/transaction_service.dart';
import 'package:renmoneytest/utils/base_model.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';
import 'package:renmoneytest/utils/store.dart';

class HomeViewModel extends BaseModel {

  final TransactionService transactionService = locator<TransactionService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<List<ClientTransaction>> transactionList() async {
  //setBusy(true);
  var result = await transactionService.getTransactionList();
  if (result is ErrorModel) {
  notifyListeners();
  throw Exception('Failed to load internet');
  //return ErrorModel(result.error);
  }
  print(result);
  return result;
  }



  //Theme settings
  late final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,

    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
    bool dark = false;
  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value;
      if (themeMode == 'light') {
        dark = false;

        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        dark = true;
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
