// {
//     "statusCode": 200,
//     "pageMeta": {
//         "page": 1,
//         "size": 20,
//         "totalEntries": 32,
//         "totalPages": 2
//     },
//     "data": [
//         {
//             "id": 486111,
//             "title": "Transaction fee",
//             "description": "USD 0.13 was deducted from your account 79337765 on 23-06-2026 17:00:16. Ref: FT252860625S404V",
//             "amount": "USD 0.13",
//             "transactionCode": "ACNBDr",
//             "date": "23-06-2026 17:00:16"
//         },

//     ],
//     "traceId": "trace_id_230115_24cd80e35"
// }

import 'package:amk_mobile/models/important_model.dart';

class TransactionModel {
  final int statusCode;
  final PageMetaDto pageMeta;
  final List<TransactionData> data;
  final String traceId;

  TransactionModel({
    required this.statusCode,
    required this.pageMeta,
    required this.data,
    required this.traceId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      statusCode: json['statusCode'],
      pageMeta: PageMetaDto.fromJson(json['pageMeta']),
      data: (json['data'] as List)
          .map((item) => TransactionData.fromJson(item))
          .toList(),
      traceId: json['traceId'],
    );
  }
}

class TransactionData {
  final int id;
  final String title;
  final String description;
  final String amount;
  final String transactionCode;
  final String date;

  TransactionData({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.transactionCode,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      amount: json["amount"],
      date: json["date"],
      transactionCode: json["transactionCode"],
    );
  }
}
