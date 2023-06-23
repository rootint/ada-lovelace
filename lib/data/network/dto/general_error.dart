class GeneralError {
  int? statusCode;
  final String? message;
  final String? detail;
  final String? error;
  GeneralError({
    this.message,
    this.error,
    this.detail,
    this.statusCode,
  });

  factory GeneralError.fromJson(Map<String, dynamic> json) {
    return GeneralError(
        message: json['message']?.toString(),
        error: json['error']?.toString(),
        detail: json['detail']?.toString(),
        statusCode: json['statusCode']);
  }

  GeneralError withCode(int? code) {
    statusCode = code;
    return this;
  }

  @override
  String toString() {
    if (message != null) {
      return message!;
    }else if (error != null) {
      return error!;
    } else {
      return super.toString();
    }
  }
}
