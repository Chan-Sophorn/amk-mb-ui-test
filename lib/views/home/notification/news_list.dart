import 'package:amk_mobile/constants/dialog_utils.dart';
import 'package:amk_mobile/services/controller/notifaction_controller.dart';
import 'package:amk_mobile/services/response/status.dart';
import 'package:amk_mobile/views/home/notification/important_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsList extends StatefulWidget {
  final NotificationController controller;

  const NewsList({
    super.key,
    required this.controller,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with AutomaticKeepAliveClientMixin {
  late final NotificationController _controller;

  bool _dialogShowing = false;

  static const String _cid = "4248808";
  static const String _channel = "MB";

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _refresh() async {
    await _controller.refreshNews(
      cid: _cid,
      channel: _channel,
      language: Get.locale?.languageCode ?? "en",
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final response = _controller.newsResponse;

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

                _controller.clearNewsError();
              });
            }

            return const SizedBox.shrink();

          case Status.success:
            final newsList = response.data?.data ?? [];

            if (newsList.isEmpty) {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 220),
                    Center(
                      child: Text(
                        "No News",
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
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: newsList.length,
                itemBuilder: (_, index) {
                  final item = newsList[index];

                  return ImportantItem(
                    title: item.title,
                    date: item.date,
                    content: item.content,
                    imageUrl: item.imageUrl,
                  );
                },
              ),
            );
        }
      },
    );
  }
}