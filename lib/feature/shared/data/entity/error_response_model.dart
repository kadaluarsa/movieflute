class ErrorResponseModel {
    ErrorResponseModel({
        this.name,
        this.message,
        this.code,
        this.status,
    });

    String name;
    String message;
    int code;
    int status;

    factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => 
      ErrorResponseModel(
        name: json['name'],
        message: json['message'],
        code: json['code'],
        status: json['status'],
      );

    Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'code': code,
        'status': status,
    };
}