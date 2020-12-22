class ServerException implements Exception {}

class CacheException implements Exception {}

class UnAuthenticatedException implements Exception {
  final String message;

  UnAuthenticatedException({this.message});
}

class SelectImageException implements Exception {}

class SelectImageFromCameraException implements Exception {}

class SelectImageFromGalleryException implements Exception {}

class AccountCreationException implements Exception {}

class PermissionException implements Exception {}

class PermissionNeverAskedException implements Exception {}

class NetworkInfoException implements Exception {}

class ServerMaintainException implements Exception {}