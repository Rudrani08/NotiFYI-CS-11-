import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed up: ${userCredential.user!.uid}');
      return userCredential;
    } catch (e) {
      print('Signup error: $e');
      throw e;
    }
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user!.uid}');
      return userCredential;
    } catch (e) {
      print('Login error: $e');
      throw e;
    }
  }

  bool isValidEmail(String email) {
    return email.endsWith('@banasthali.in');
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String? getCurrentUserEmail() {
    User? user = _auth.currentUser;
    return user?.email;
  }
}
  

 






















// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   User? get currentUser => null;

//   Future<User?> signInWithEmailAndPassword(String email, String password,
//       {required String email, required String password}) async {
//     try {
//       // Check if the email is allowed
//       if (!email.endsWith('@banasthali.in')) {
//         throw FirebaseAuthException(
//           code: 'invalid-email-domain',
//           message:
//               'Only email addresses ending with "@banasthali.in" are allowed.',
//         );
//       }

//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       print('Sign in failed: $e');
//       return null;
//     }
//   }

//   Future<User?> signUpWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       // Check if the email is allowed
//       if (!email.endsWith('@banasthali.in')) {
//         throw FirebaseAuthException(
//           code: 'invalid-email-domain',
//           message:
//               'Only email addresses ending with "@banasthali.in" are allowed.',
//         );
//       }

//       final UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       print('Sign up failed: $e');
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print('Sign out failed: $e');
//     }
//   }

//   User? getCurrentUser() {
//     return _auth.currentUser;
//   }

//   createUserEmailAndPassword(
//       {required String email, required String password}) {}
// }
