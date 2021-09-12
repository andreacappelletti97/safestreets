import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/profile_remote_data_source.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class RegistrationRemoteDataSource {
  /// Sign up user to the app with email and password
  /// inside the [Registration] model obejct
  Future<User> postRegistration(Registration registration);
}

/// Registration with cloud function
class RegistrationFirebaseFunctionRemoteDataSource
    implements RegistrationRemoteDataSource {
  final http.Client client;
  final String url;
  final ProfileRemoteDataSource profileRemoteDataSource;

  const RegistrationFirebaseFunctionRemoteDataSource({
    @required this.client,
    @required this.url,
    @required this.profileRemoteDataSource,
  });

  @override
  Future<User> postRegistration(Registration registration) async {
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: registration.toJson(),
      );

      if (response.statusCode == 200) {
        final userIDRegistration = response.body;
        final userIDAuth = await profileRemoteDataSource.userAuthentication(
          registration.email,
          registration.password,
        );

        if (userIDRegistration != userIDAuth.userID) {
          throw FirebaseAuthException();
        } else {
          return userIDAuth;
        }
      } else {
        throw FirebaseRegistrationException();
      }
    } catch (e) {
      throw FirebaseRegistrationException();
    }
  }
}
