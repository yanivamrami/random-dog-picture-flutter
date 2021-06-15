class DogImageResponse {
  String message;
  String status;

  DogImageResponse({this.message, this.status});

  factory DogImageResponse.fromJson(Map<String, dynamic> jsonString) {
    return DogImageResponse(
        message: jsonString['message'], status: jsonString['status']);
  }
}
