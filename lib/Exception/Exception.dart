class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Une erreur s'est produite durant la connexion: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Requete invalide: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "non autoriser: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Entree invalide: ");
}
