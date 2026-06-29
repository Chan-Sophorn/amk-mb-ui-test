import 'package:amk_mobile/constants/dialog_utils.dart';
import 'package:amk_mobile/services/controller/notifaction_controller.dart';
import 'package:amk_mobile/services/response/status.dart';
import 'package:amk_mobile/views/home/notification/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionList extends StatefulWidget {
  final NotificationController controller;

  const TransactionList({
    super.key,
    required this.controller,
  });

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList>
    with AutomaticKeepAliveClientMixin {
  late final NotificationController _controller;
  late final ScrollController _scrollController;

  bool _dialogShowing = false;

  static const String _cid = "4248808";
  static const String _limit = "10";
  static const String _order = "DESC";

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;

    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  @override
  bool get wantKeepAlive => true;

  void _onScroll() {
    if (_scrollController.position.extentAfter < 200) {
      _controller.loadMoreTransaction(
        cid: _cid,
        limit: _limit,
        order: _order,
        language: Get.locale?.languageCode ?? "en",
      );
    }
  }

  Future<void> _refresh() async {
    await _controller.refreshTransaction(
      cid: _cid,
      limit: _limit,
      order: _order,
      language: Get.locale?.languageCode ?? "en",
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final response = _controller.transactionResponse;

        switch (response.status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case Status.error:
            if (!_dialogShowing) {
              _dialogShowing = true;

              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await DialogUtils.showMessageDialog(
                  context,
                  message: response.message ?? "Unknown error",
                  onPressed: () {},
                );

                _dialogShowing = false;

                _controller.clearTransactionError();
              });
            }

            return const SizedBox.shrink();

          case Status.success:
            final transactions = response.data?.data ?? [];

            if (transactions.isEmpty) {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 220),
                    Center(
                      child: Text(
                        "No Transaction",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: transactions.length +
                    (_controller.isLoadingMore ? 1 : 0),
                itemBuilder: (_, index) {
                  if (index == transactions.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final item = transactions[index];

                  return NotificationItem(
                    title: item.title,
                    date: item.date,
                    description: item.description,
                    color: _getColor(item.transactionCode),
                    icon: _getIcon(item.transactionCode),
                  );
                },
              ),
            );
        }
      },
    );
  }

  Color _getColor(String code) {
    switch (code.trim()) {
      case "ACNBDr":
        return Colors.blue;

      case "ACBPDr":
        return Colors.orange;

      case "ACNBCr":
        return Colors.green;

      case "ACBPCr":
        return Colors.purple;

      default:
        return Colors.grey;
    }
  }

  IconData _getIcon(String code) {
    switch (code.trim()) {
      case "ACNBDr":
        return Icons.attach_money;

      case "ACBPDr":
        return Icons.currency_exchange;

      case "ACNBCr":
        return Icons.savings;

      case "ACBPCr":
        return Icons.account_balance_wallet;

      default:
        return Icons.receipt_long;
    }
  }
}