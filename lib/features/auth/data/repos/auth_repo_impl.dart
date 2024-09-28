import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/end_points.dart';
import 'package:fruits_hub/features/auth/data/models/user_mode.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return left(
        ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخري.'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      User user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return left(
        ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخري.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseService.checkIsDataExist(
          path: EndPoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: $e');
      await deleteUser(user);
      return left(
        ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخري.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseService.checkIsDataExist(
          path: EndPoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: $e');
      await deleteUser(user);
      return left(
        ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخري.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addUserData(
      path: EndPoints.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseService.getData(
      path: EndPoints.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }
}
