// Mocks generated by Mockito 5.3.2 from annotations
// in comic_app/test/src/User/repository/cloud_firestore_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:comic_app/src/User/model/user.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

import 'cloud_firestore_api_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCollectionReference_0<T extends Object?> extends _i1.SmartFake
    implements _i2.CollectionReference<T> {
  _FakeCollectionReference_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CloudFrestoreApiTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCloudFrestoreApiTest extends _i1.Mock
    implements _i3.CloudFrestoreApiTest {
  MockCloudFrestoreApiTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CollectionReference<Object?> get dbUsers => (super.noSuchMethod(
        Invocation.getter(#dbUsers),
        returnValue: _FakeCollectionReference_0<Object?>(
          this,
          Invocation.getter(#dbUsers),
        ),
      ) as _i2.CollectionReference<Object?>);
  @override
  _i4.Future<void> updateUserData(_i5.UserModel? user) => (super.noSuchMethod(
        Invocation.method(
          #updateUserData,
          [user],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> getUserData(String? uid) => (super.noSuchMethod(
        Invocation.method(
          #getUserData,
          [uid],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}
