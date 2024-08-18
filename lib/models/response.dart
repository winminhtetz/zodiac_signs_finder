class Response<T> {
  final String message;
  final int statusCode;
  final T data;

  Response({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  Response copyWith({
    required String? message,
    required int? statusCode,
    required T? data,
  }) {
    return Response(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': statusCode,
        'message': message,
        'data': data,
      };
}
