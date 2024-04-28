class Failure {
  const Failure({
    this.message = 'Something went wrong, please try again later',
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}
