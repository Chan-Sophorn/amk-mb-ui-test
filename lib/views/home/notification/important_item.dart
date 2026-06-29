import 'package:amk_mobile/constants/utils.dart';
import 'package:amk_mobile/views/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class ImportantItem extends StatelessWidget {
  final String? title;
  final String? date;
  final String? content;
  final String? imageUrl;

  const ImportantItem({
    super.key,
    this.title,
    this.date,
    this.content,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .15),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null && imageUrl!.isNotEmpty)
              Image.network(
                imageUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null && title!.isNotEmpty)
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 4),
                  Text(
                    Utils.formatDateTime(date ?? ""),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  ExpandableText(text: content ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
