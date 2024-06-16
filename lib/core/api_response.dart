// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiResponse {
  final bool error;
  final String message;
  final dynamic data;
  ApiResponse({
    required this.error,
    required this.message,
     this.data,
  });
}
