import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './user_data.dart';
class User {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;


  User({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();



  Future<FirebaseUser> signInWithGoogle() async {

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword( email: email, password: password, );
  }

  Future<void> signUp({String email, String password}) async {

    return await _firebaseAuth.createUserWithEmailAndPassword( email: email, password: password, );
  }

  Future<void> signOut() async {

    return Future.wait([ _firebaseAuth.signOut(),  _googleSignIn.signOut(), ]);

  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
  
  Future<UserData> getUserData() async {
    return UserData( 
      email:    (await _firebaseAuth.currentUser()).email ,
      uid:      (await _firebaseAuth.currentUser()).uid ,
      name:     (await _firebaseAuth.currentUser()).displayName ,
      photoUrl: (await _firebaseAuth.currentUser()).photoUrl ,
    
    );
  }
  

  Future<String> userEmail()  async { return (await _firebaseAuth.currentUser()).email; }
  Future<String> userId()     async { return (await _firebaseAuth.currentUser()).uid; }
  Future<String> userName()   async { return (await _firebaseAuth.currentUser()).displayName; }
  Future<String> userPhoto()  async { return (await _firebaseAuth.currentUser()).photoUrl; }


}

