/// /// /// Model class for Datatable /// /// ///

class ApiResponse {
  final String message;
  final Data data;

  ApiResponse({required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    message: json['message'] as String,
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

class Data {
  final List<ImageItem> list;
  final int totalCount;

  Data({required this.list, required this.totalCount});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: (json['list'] as List)
        .map((itemJson) => ImageItem.fromJson(itemJson as Map<String, dynamic>))
        .toList(),
    totalCount: json['totalCount'] as int,
  );
}

class ImageItem {
  final String id;
  final String name;
  final int docType;
  final int uid;
  final String url;

  ImageItem({
    required this.id,
    required this.name,
    required this.docType,
    required this.uid,
    required this.url,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
    id: json['_id'] as String,
    name: json['_name'] as String,
    docType: json['_docType'] as int,
    uid: json['_uid'] as int,
    url: json['_url'] as String,
  );
}
