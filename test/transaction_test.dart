import 'package:flutter/material.dart';
import 'package:renmoneytest/core/model/clien_transaction.dart';
import 'package:renmoneytest/core/services/transaction_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api/mock_api.dart';

TransactionService? _api = TransactionService();
MockApi mockApi = MockApi();
ClientTransaction transaction =
ClientTransaction(
    transactionId: 1, type: 'DEPOSIT', amount: 9000, comment: "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4", entryDate: "2022-03-09T09:26:40+0000", currencyCode: "NGN",  balance: "98000");

void main() {
  setUp(() async {
    await mockApi.start();
  });

  tearDown(() {
    mockApi.shutdown();
  });

  group('Client', () {
    group('GetAllTasks should', () {
      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: "");

        await _api!.getTransactionList();

        mockApi.expectRequestSentTo('/todos');
      });

      test('sends accept header', () async {
        await mockApi.enqueueMockResponse(fileName: "");

        await _api!.getTransactionList();

        mockApi.expectRequestContainsHeader('accept', 'application/json');
      });

      test('parse current news properly getting all transaction', () async {
        await mockApi.enqueueMockResponse(fileName: "");

        final tasks = await _api!.getTransactionList();

        expectTasksContainsExpectedValues(tasks[0]);
      });

      test(
          'throws UnknownErrorException if there is not handled error getting transaction',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _api!.getTransactionList(),
            throw NetworkImageLoadException(statusCode: 400, uri:Uri.parse("uri"))
        );
      });
    });

  });
}

void expectTasksContainsExpectedValues(ClientTransaction transaction) {
  expect(transaction, isNotNull);
  expect(transaction.transactionId, 1);
  expect(transaction.type, 'DEPOSIT');
  expect(transaction.amount, 9000);
  expect(transaction.comment, "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4");
  expect(transaction.entryDate, "2022-03-09T09:26:40+0000");
  expect(transaction.currencyCode, 'NGN');
  expect(transaction.balance, '98000');

}
