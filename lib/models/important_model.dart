class ImportantModel {
  final int statusCode;
  final PageMetaDto pageMetaDto;
  final List<NotificationData> data;
  final String traceId;

  ImportantModel({
    required this.statusCode,
    required this.pageMetaDto,
    required this.data,
    required this.traceId,
  });
  
  factory ImportantModel.fromJson(Map<String, dynamic> json) {
    return ImportantModel(
      statusCode: json['statusCode'],
      pageMetaDto: PageMetaDto.fromJson(json['pageMetaDto']),
      data: (json['data'] as List)
          .map((item) => NotificationData.fromJson(item))
          .toList(),
      traceId: json['traceId'],
    );
  }
}

class PageMetaDto {
  final int page;
  final int size;
  final int totalEntries;
  final int totalPages;

  PageMetaDto({
    required this.page,
    required this.size,
    required this.totalEntries,
    required this.totalPages,
  });

  factory PageMetaDto.fromJson(Map<String, dynamic> json) {
    return PageMetaDto(
      page: json['page'],
      size: json['size'],
      totalEntries: json['totalEntries'],
      totalPages: json['totalPages'],
    );
  }
}

class NotificationData {
  final int id;
  final String title;
  final String content;
  final String processingCode;
  final String date;
  final String? imageUrl;

  NotificationData({
    required this.id,
    required this.title,
    required this.content,
    required this.processingCode,
    required this.date,
    this.imageUrl,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      processingCode: json['processingCode'],
      date: json['date'],
      imageUrl: json['imageUrl'],
    );
  }
}
