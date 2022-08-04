import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookSignIn = FacebookLogin();
Future<void> signOutGoogle() async {
  await _auth.signOut();
  await googleSignIn.signOut();
  print("User Signed Out");
}

Future<void> signOutFacebook() async {
  await _auth.signOut();
  await facebookSignIn.logOut();
  print("User Signed Out");
}

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  await signOutGoogle();
  GoogleSignInAccount googleSignInAccount;
  try {
    googleSignInAccount = await googleSignIn.signIn();
    
  } on PlatformException catch (err) {
    print('Have error: $err');
  }

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  print('accessToken Google: ' + credential.accessToken);
  return credential.accessToken;
  // final UserCredential authResult =
  //     await _auth.signInWithCredential(credential);
  // final User user = authResult.user;

  // if (user != null) {
  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);
  //   final User currentUser = _auth.currentUser;
  //   assert(user.uid == currentUser.uid);
  //   //return accessToken
  //   print('accessToken: ' + credential.accessToken);
  //   print('idToken: ' + credential.idToken);

  //   return credential.accessToken;
  // }
  //return null;
}

Future<String> signInWithFacebook() async {
  await Firebase.initializeApp();
  await signOutFacebook();
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

  if (result.status == FacebookLoginStatus.loggedIn) {
    final credential =
        FacebookAuthProvider.credential(result.accessToken.token);
    print('accessToken Facebook: ' + credential.accessToken);
    return credential.accessToken;
    // final UserCredential authResult =
    //     await _auth.signInWithCredential(credential);
    // //Lấy thông tin User qua credential có giá trị token đã đăng nhập
    // final User user = authResult.user;
    // if (user != null) {
    //   print('Facebook accessToken: ' + credential.accessToken);
    //   return credential.accessToken;
    // } else {
    //   print('Can not get AccessToken Facebook');
    // }
  }
  return null;
}
