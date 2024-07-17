

import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable{
  List<RequestError> errors;
  ErrorResponse({required this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errors: List<RequestError>.from(json["errors"].map((x) => RequestError.fromJson(x))),
    );
    
  @override
  List<Object?> get props => [errors];
}

class RequestError extends Equatable{

    String type;
    String value;
    String msg;
    String path;
    String location;

    RequestError({
        required this.type,
        required this.value,
        required this.msg,
        required this.path,
        required this.location,
    });

    factory RequestError.fromJson(Map<String, dynamic> json) => RequestError(
        type: json["type"],
        value: json["value"],
        msg: json["msg"],
        path: json["path"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
        "msg": msg,
        "path": path,
        "location": location,
    };
    
      @override
      List<Object?> get props => [
        type,
        value,
        msg,
        path,
        location,
      ];
  
}