
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/core/model/error_model.dart';
import 'package:renmoneytest/core/services/index.dart';
import 'package:renmoneytest/utils/http/paths.dart';

class TransactionService {

  // This fetch the data from the API
  getTransactionList() async {
    try {
      final result = await http.get(Paths.fetchTransaction);
      if (result is ErrorModel) {
        // This controls the error from the api
        var data = result.error;
        List<ClientTransaction> packageList = List<ClientTransaction>.from(
            data.map((item) => ClientTransaction.fromJson(item)));
        return ErrorModel(packageList);
      }
      // This get the data from the api and sends to the view model
      var data = result.data['data']["clientTransactions"];
      List<ClientTransaction> packageList = List<ClientTransaction>.from(
          data.map((item) => ClientTransaction.fromJson(item)));
      return packageList;
    } catch (e) {
      return ErrorModel('$e');
    }
  }


}
