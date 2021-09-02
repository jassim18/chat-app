import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

       static Future<bool> saveuserLoggedInSharedPreference(bool isUserLoggedIn)async{
         SharedPreferences prefs = await SharedPreferences.getInstance();
         return  prefs.setBool(sharedPreferenceUserLoggedInKey,isUserLoggedIn);
       }
  static Future<bool> saveuserNameSharedPreference(String username)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.setString(sharedPreferenceUserNameKey,username);
  }
  static Future<bool> saveuserEmailSharedPreference(String useremail)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.setString(sharedPreferenceUserEmailKey,useremail);
  }

  static Future<bool> getuserLoggedInSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }
  static Future<String> getuserNameSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserNameKey);
  }
  static Future<String> getuserEmailSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserEmailKey);
  }


}