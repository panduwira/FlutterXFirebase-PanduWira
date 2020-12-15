import 'package:saa2_assignment/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_user_extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser({String name = "No Name"}) =>
      Users(this.uid, this.email, name: name);
}
