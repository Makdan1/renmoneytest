/// transactionId : 148818
/// type : "TRANSFER"
/// amount : -4000.0
/// comment : "Transfer: Transferred from Olawale Renmoney Account from 3580016662"
/// entryDate : "2022-03-09T09:29:09+0000"
/// currencyCode : "NGN"
/// balance : "88900"

class ClientTransaction {
  ClientTransaction({
      int? transactionId, 
      String? type, 
      double? amount, 
      String? comment, 
      String? entryDate, 
      String? currencyCode, 
      String? balance,}){
    _transactionId = transactionId;
    _type = type;
    _amount = amount;
    _comment = comment;
    _entryDate = entryDate;
    _currencyCode = currencyCode;
    _balance = balance;
}

  ClientTransaction.fromJson(dynamic json) {
    _transactionId = json['transactionId'];
    _type = json['type'];
    _amount = json['amount'];
    _comment = json['comment'];
    _entryDate = json['entryDate'];
    _currencyCode = json['currencyCode'];
    _balance = json['balance'];
  }
  int? _transactionId;
  String? _type;
  double? _amount;
  String? _comment;
  String? _entryDate;
  String? _currencyCode;
  String? _balance;

  int? get transactionId => _transactionId;
  String? get type => _type;
  double? get amount => _amount;
  String? get comment => _comment;
  String? get entryDate => _entryDate;
  String? get currencyCode => _currencyCode;
  String? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transactionId'] = _transactionId;
    map['type'] = _type;
    map['amount'] = _amount;
    map['comment'] = _comment;
    map['entryDate'] = _entryDate;
    map['currencyCode'] = _currencyCode;
    map['balance'] = _balance;
    return map;
  }

}