import 'package:amk_mobile/models/important_model.dart';
import 'package:amk_mobile/models/transaction_model.dart';
import 'package:amk_mobile/services/network/api_url.dart';
import 'package:amk_mobile/services/network/network_api_service.dart';

class NotificationService {
  final _apiService = NetworkApiService();

  Future<ImportantModel> getNotificationImportant({
    required String cid,
    required String channel,
    required int page,
    required int limit,
    required String order,
    required String platform,
    required String language,
  }) async {
    final uri =
        Uri.parse(
          "${ApiUrl.notificationBaseUrl}${ApiUrl.importanceNotification}",
        ).replace(
          queryParameters: {
            "cid": cid,
            "channel": channel,
            "page": page.toString(),
            "limit": limit.toString(),
            "order": order,
            "plateform": platform,
            "language": language,
          },
        );

    try {
      print("Request URL: ${uri.toString()}");
      final response = await _apiService.getGetApiResponse(uri.toString());
      return ImportantModel.fromJson(response);
    } catch (e) {
      throw Exception("Failed to load notifications: $e");
    }
  }

  Future<TransactionModel> getTransactionList({
    required String cid,
    required String limit,
    required int page,
    required String order,
    required String language,
  }) async {
    final uri = Uri.parse(ApiUrl.notificationBaseUrl).replace(
      queryParameters: {
        "cid": cid,
        "page": page.toString(),
        "limit": limit.toString(),
        "order": order,
        "language": language,
      },
    );
    try {
      print("Request URL: ${uri.toString()}");
      final response = await _apiService.getGetApiResponse(uri.toString());
      print("Transaction Response: $response");
      return TransactionModel.fromJson(response);
    } catch (e) {
      throw Exception("Failed load News: $e");
    }
  }
}
