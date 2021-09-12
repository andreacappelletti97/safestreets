import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/core/error/exceptions.dart';

// Reference to names of collection db firestore
const String FIRESTORE_USER_COLLECTION = 'user';

abstract class ProfileRemoteDataSource {
  /// Authenticate the user given his/her email and password
  Future<User> userAuthentication(
    String email,
    String password,
  );

  /// Sign out the user from current auth session
  Future<void> userLogout();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final Firestore firestore;

  const ProfileRemoteDataSourceImpl({
    @required this.firebaseAuth,
    @required this.firestore,
  });

  @override
  Future<User> userAuthentication(
    String email,
    String password,
  ) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userID = result.user.uid;

      final userData = await firestore
          .collection(
            FIRESTORE_USER_COLLECTION,
          )
          .document(
            userID,
          )
          .get();
      final userInfo = userData.data..remove('displayName');
      userInfo['userID'] = userID;

      final jsonString = jsonEncode(userInfo);
      final user = User.fromJson(jsonString);
      return user;
    } catch (e) {
      throw FirebaseAuthException();
    }
  }

  @override
  Future<void> userLogout() async => await firebaseAuth.signOut();
}
