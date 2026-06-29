import 'package:flutter/material.dart';

import 'package:amk_mobile/models/important_model.dart';
import 'package:amk_mobile/models/transaction_model.dart';
import 'package:amk_mobile/services/network/notification/notification_service.dart';
import 'package:amk_mobile/services/response/api_response.dart';
import 'package:amk_mobile/services/response/status.dart';

class NotificationController extends ChangeNotifier {
  final NotificationService _service = NotificationService();

  ApiResponse<ImportantModel> _importantResponse = ApiResponse.loading();

  ApiResponse<ImportantModel> get importantResponse => _importantResponse;

  bool _importantLoaded = false;

  Future<void> getImportantNotifications({
    required String cid,
    required String channel,
    required int page,
    required int limit,
    required String order,
    required String platform,
    required String language,
    bool forceRefresh = false,
  }) async {
    if (_importantLoaded && !forceRefresh) return;

    _importantLoaded = true;

    _importantResponse = ApiResponse.loading();
    notifyListeners();

    try {
      final response = await _service.getNotificationImportant(
        cid: cid,
        channel: channel,
        page: page,
        limit: limit,
        order: order,
        platform: platform,
        language: language,
      );

      _importantResponse = ApiResponse.success(response);
    } catch (e) {
      _importantLoaded = false;
      _importantResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> refreshImportant({
    required String cid,
    required String channel,
    required String language,
  }) async {
    _importantLoaded = false;

    await getImportantNotifications(
      cid: cid,
      channel: channel,
      page: 1,
      limit: 20,
      order: "DESC",
      platform: "android",
      language: language,
      forceRefresh: true,
    );
  }

  void clearImportantError() {
    if (_importantResponse.status == Status.error) {
      _importantResponse = ApiResponse.success(
        ImportantModel(
          statusCode: 0,
          pageMetaDto: PageMetaDto(
            page: 1,
            size: 0,
            totalEntries: 0,
            totalPages: 0,
          ),
          data: [],
          traceId: "",
        ),
      );

      notifyListeners();
    }
  }

  // Transaction
  
  ApiResponse<TransactionModel> _transactionResponse =
      ApiResponse.loading();

  ApiResponse<TransactionModel> get transactionResponse =>
      _transactionResponse;

  bool _transactionLoaded = false;

  bool _isLoadingMore = false;

  bool _hasMore = true;

  int _currentPage = 1;

  bool get isLoadingMore => _isLoadingMore;

  bool get hasMore => _hasMore;

  int get currentPage => _currentPage;

  Future<void> getTransactionList({
    required String cid,
    required String limit,
    required int page,
    required String order,
    required String language,
    bool isLoadMore = false,
    bool forceRefresh = false,
  }) async {
    if (!isLoadMore &&
        _transactionLoaded &&
        !forceRefresh) {
      return;
    }

    if (isLoadMore && (!_hasMore || _isLoadingMore)) {
      return;
    }

    if (!isLoadMore) {
      _transactionLoaded = true;
      _currentPage = 1;
      _hasMore = true;

      _transactionResponse = ApiResponse.loading();
      notifyListeners();
    } else {
      _isLoadingMore = true;
      notifyListeners();
    }

    try {
      final response = await _service.getTransactionList(
        cid: cid,
        limit: limit,
        page: _currentPage,
        order: order,
        language: language,
      );

      _hasMore =
          response.pageMeta.page < response.pageMeta.totalPages;

      if (isLoadMore) {
        _transactionResponse.data?.data.addAll(response.data);
      } else {
        _transactionResponse =
            ApiResponse.success(response);
      }

      if (response.data.isNotEmpty) {
        _currentPage++;
      }
    } catch (e) {
      if (!isLoadMore) {
        _transactionLoaded = false;
        _transactionResponse =
            ApiResponse.error(e.toString());
      }
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> refreshTransaction({
    required String cid,
    required String limit,
    required String order,
    required String language,
  }) async {
    _transactionLoaded = false;

    await getTransactionList(
      cid: cid,
      limit: limit,
      page: 1,
      order: order,
      language: language,
      forceRefresh: true,
    );
  }

  Future<void> loadMoreTransaction({
    required String cid,
    required String limit,
    required String order,
    required String language,
  }) async {
    await getTransactionList(
      cid: cid,
      limit: limit,
      page: _currentPage,
      order: order,
      language: language,
      isLoadMore: true,
    );
  }

  void clearTransactionError() {
    if (_transactionResponse.status == Status.error) {
      _transactionResponse = ApiResponse.success(
        TransactionModel(
          statusCode: 0,
          pageMeta: PageMetaDto(
            page: 1,
            size: 0,
            totalEntries: 0,
            totalPages: 0,
          ),
          data: [],
          traceId: "",
        ),
      );

      notifyListeners();
    }
  }

  // News
  ApiResponse<ImportantModel> _newsResponse =
      ApiResponse.loading();

  ApiResponse<ImportantModel> get newsResponse =>
      _newsResponse;

  bool _newsLoaded = false;

  Future<void> getNews({
    required String cid,
    required String channel,
    required int page,
    required int limit,
    required String order,
    required String platform,
    required String language,
    bool forceRefresh = false,
  }) async {
    if (_newsLoaded && !forceRefresh) return;

    _newsLoaded = true;

    _newsResponse = ApiResponse.loading();
    notifyListeners();

    try {
      /// Replace with your News API
      final response = await _service.getNotificationImportant(
        cid: cid,
        channel: channel,
        page: page,
        limit: limit,
        order: order,
        platform: platform,
        language: language,
      );

      _newsResponse = ApiResponse.success(response);
    } catch (e) {
      _newsLoaded = false;
      _newsResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> refreshNews({
    required String cid,
    required String channel,
    required String language,
  }) async {
    _newsLoaded = false;

    await getNews(
      cid: cid,
      channel: channel,
      page: 1,
      limit: 20,
      order: "DESC",
      platform: "android",
      language: language,
      forceRefresh: true,
    );
  }

  void clearNewsError() {
    if (_newsResponse.status == Status.error) {
      _newsResponse = ApiResponse.success(
        ImportantModel(
          statusCode: 0,
          pageMetaDto: PageMetaDto(
            page: 1,
            size: 0,
            totalEntries: 0,
            totalPages: 0,
          ),
          data: [],
          traceId: "",
        ),
      );

      notifyListeners();
    }
  }
}