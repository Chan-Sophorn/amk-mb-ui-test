import 'package:amk_mobile/constants/app_color.dart';
import 'package:amk_mobile/services/controller/notifaction_controller.dart';
import 'package:amk_mobile/views/home/notification/important_list.dart';
import 'package:amk_mobile/views/home/notification/news_list.dart';
import 'package:amk_mobile/views/home/notification/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late final NotificationController _controller;

  int _selectedIndex = 0;

  static const String _cid = "4248808";
  static const String _channel = "MB";
  static const String _platform = "android";
  static const String _order = "DESC";
  static const int _limit = 20;

  final List<String> tabs = [
    "important",
    "transaction",
    "news",
  ];

  @override
  void initState() {
    super.initState();

    _controller = NotificationController();

    _loadCurrentTab();
  }

  Future<void> _loadCurrentTab() async {
    final language = Get.locale?.languageCode ?? "en";

    switch (_selectedIndex) {
      case 0:
        await _controller.getImportantNotifications(
          cid: _cid,
          channel: _channel,
          page: 1,
          limit: _limit,
          order: _order,
          platform: _platform,
          language: language,
        );
        break;

      case 1:
        await _controller.getTransactionList(
          cid: _cid,
          limit: "10",
          page: 1,
          order: _order,
          language: language,
        );
        break;

      case 2:
        await _controller.getNews(
          cid: _cid,
          channel: _channel,
          page: 1,
          limit: _limit,
          order: _order,
          platform: _platform,
          language: language,
        );
        break;
    }
  }

  Future<void> _changeTab(int index) async {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    await _loadCurrentTab();
  }

  Widget _buildTab(int index) {
    final selected = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _changeTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFFA63773)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              tabs[index].tr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return ImportantList(controller: _controller);

      case 1:
        return TransactionList(controller: _controller);

      case 2:
        return NewsList(controller: _controller);

      default:
        return const SizedBox();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grayColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: .3,
        title: Text(
          "notification".tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: List.generate(
                tabs.length,
                (index) => _buildTab(index),
              ),
            ),
          ),

          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }
}