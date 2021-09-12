import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:safestreets/app/data/datasources/profile_local_data_source.dart';
import 'package:safestreets/app/data/datasources/profile_remote_data_source.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/data/repositories/profile_repository_impl.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';

class MockProfileLocalDataSource extends Mock
    implements ProfileLocalDataSource {}

class MockProfileRemoteDataSource extends Mock
    implements ProfileRemoteDataSource {}

void main() {
  MockProfileLocalDataSource localDataSource;
  MockProfileRemoteDataSource remoteDataSource;
  ProfileRepository repository;

  setUp(() {
    localDataSource = MockProfileLocalDataSource();
    remoteDataSource = MockProfileRemoteDataSource();
    repository = ProfileRepositoryImpl(
      profileLocalDataSource: localDataSource,
      profileRemoteDataSource: remoteDataSource,
    );
  });

  group('login', () {
    final tEmail = 'mail@mail.com';
    final tPassword = 'PasswordMAIUSC123';

    final tUser = User(
      (u) => u
        ..userID = 'abc'
        ..authority = true
        ..email = tEmail,
    );

    test('should call the remote data source to authenticate the user',
        () async {
      when(remoteDataSource.userAuthentication(any, any)).thenAnswer(
        (_) async => tUser,
      );

      repository.login(tEmail, tPassword);

      verify(
        remoteDataSource.userAuthentication(
          tEmail,
          tPassword,
        ),
      );
    });

    test(
        'should return the user id as a String if the authentication is successful',
        () async {
      when(remoteDataSource.userAuthentication(any, any)).thenAnswer(
        (_) async => tUser,
      );

      final result = await repository.login(tEmail, tPassword);
      expect(result, Right(tUser));
    });
  });
}
