part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;

  static Future<String> signUp(
      String email, String password, String name) async {
    await Firebase.initializeApp();
    String msg = "Signed up successfully";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users users = result.user.convertToUser(name: name);

      auth.signOut();
      await UserServices.updateUser(users);
      msg = "Signed up successfully";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String msg = "Success";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => msg = "success",
          );
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }

  static Future<bool> signout() async {
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }
}
