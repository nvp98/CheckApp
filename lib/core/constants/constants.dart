// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class Constants {
//   static String currency = "\$";

//   static Locale engLocal = Locale('en');
//   static Locale arLocal = Locale('ar');
// }

// Future<String> getToken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString("token") ?? "";
//   if (token == "") {
//     return "";
//   } else {
//     final payloadData = utf8
//         .fuse(base64)
//         .decode(base64.normalize(token.toString().split('.')[1]));
//     final payload = jsonDecode(payloadData);

//     if (payload['exp'] * 1000 > DateTime.now().toUtc().millisecondsSinceEpoch) {
//       // print(token);
//       return token.toString();
//     } else
//       return "";
//   }
// }

// onLogout() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.remove("token");
//   final ID = prefs.remove("ID");
//   final name = prefs.remove("Name");
//   // final mnv = prefs.remove("MaNV");
//   // printOut(ID.toString());
//   // Restart.restartApp();
// }

// getStore(key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final val = prefs.getString(key);
//   return val;
// }

// getIntStore(key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final val = prefs.getInt(key);
//   return val;
// }

// getStoreBool(key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final val = prefs.getBool(key);
//   return val;
// }
