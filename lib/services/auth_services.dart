part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SigninSignupresult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);
      return SigninSignupresult(user: user);
    } catch (e) {
      return SigninSignupresult(massage: e.toString());
    }
  }
}

class SigninSignupresult {
  final User user;
  final String massage;

  SigninSignupresult({this.user, this.massage});
}
