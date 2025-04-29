import "package:flutter/foundation.dart";
import "package:local_auth/local_auth.dart";

class LocalAuthService {
  static final _auth = LocalAuthentication();
  static Future<bool> _canAuthenticate() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    if (await _canAuthenticate()) {
      try {
        return await _auth.authenticate(
          localizedReason: "Please authenticate to access this feature",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
      } catch (e) {
        debugPrint("Error during authentication: $e");
        return false;
      }
    }
    return false;
  }
}
