import 'package:baseapp/models/user.dart';
import 'package:baseapp/utils/shared_pref.dart';

class AuthService{
  static signUpWithEmailAndPassword(String email,String username,String password){

  }
  static Future<User> signInWithEmailAndPassword(String email,String password)async{
    if(email=='abhi@gmail.com'&&password=='Abhi@2472'){
      User newUser= User(name: 'Abhishek Jain',password: password,emailId: email);
      print('sign in successful');
      await SharedPref.saveUserToSharedRef('loggedInUser', newUser);
      return newUser;
    }else{
      return null;
    }
  }
  static Future<bool> signOut()async{
    return await SharedPref.remove('loggedInUser');
  }
}