
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/core/model/error_model.dart';
import 'package:renmoneytest/core/services/index.dart';
import 'package:renmoneytest/utils/http/paths.dart';

class TransactionService {

  getTransactionList() async {
    try {
      final result = await http.get(Paths.fetchTransaction);
      if (result is ErrorModel) {
        var data = result.error;
        print(result.error);
        List<ClientTransaction> packageList = List<ClientTransaction>.from(
            data.map((item) => ClientTransaction.fromJson(item)));
        return ErrorModel(packageList);
      }
      var data = result.data['data']["clientTransactions"];
      List<ClientTransaction> packageList = List<ClientTransaction>.from(
          data.map((item) => ClientTransaction.fromJson(item)));
      return packageList;
    } catch (e) {
      return ErrorModel('$e');
    }
  }


}
