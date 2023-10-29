class ResponseModel<T>{
  T? model;
  String? errorMessage;

  ResponseModel({this.model, this.errorMessage});

  bool get hasError => errorMessage != null;

}