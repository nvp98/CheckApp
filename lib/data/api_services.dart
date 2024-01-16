// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:mystic_academy/core/constants/apiconfig.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mystic_academy/core/app_export.dart';
// import 'package:mystic_academy/models/model_export.dart';
// import '../core/constants/navigator_key.dart';
// import '../presentation/sign_in_screen/sign_in_screen.dart';
// import '../widgets/custom_alert.dart';

// class ApiService {
//   listHeaderConfig() async {
//     Future<String> gettoken = getToken();

//     gettoken
//         .then((value) => {
//               if (value.toString().isEmpty)
//                 {
//                   showDialog(
//                     context: navigatorKey.currentContext!,
//                     builder: (context) {
//                       return CustomAlertOK(
//                         title: "Thông báo",
//                         content:
//                             "Phiên đăng nhập đã hết hạn! \n Vui lòng đăng nhập lại",
//                         onTap: () {
//                           Navigator.of(context).pop();
//                           FocusScope.of(context).unfocus();
//                           navigatorKey.currentState?.push(
//                             MaterialPageRoute(builder: (_) => SignInScreen()),
//                           );
//                         },
//                       );
//                     },
//                   )
//                 }
//             })
//         .catchError((error) => {});
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString("token");

//     Map<String, String> headers = {
//       "content-type": "application/json",
//       "accept": "application/json",
//       "Authorization": 'Bearer $token',
//     };
//     return headers;
//   }

//   Future postLogin(body) async {
//     try {
//       var url = Uri.parse(Apiconfig.baseUrl + Apiconfig.userAuth);
//       Map<String, String> headers = {
//         "content-type": "application/json",
//         "accept": "application/json",
//       };
//       var response = await http.post(url, headers: headers, body: body);
//       if (response.statusCode == 200) {
//         return response.body;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getEclassroom(id, bool? all) async {
//     try {
//       var url =
//           Uri.parse("${Apiconfig.baseUrl + Apiconfig.eClassrom}/$id?all=$all");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getIDLH(id) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.getIDHT}?idht=$id");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getEclassroom_join(id, bool? xntg) async {
//     try {
//       var url = Uri.parse(
//           "${Apiconfig.baseUrl + Apiconfig.eClassrom}/$id?XNTG=$xntg");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getSTest(id) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.sTest}/$id");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getFResults(id, String year) async {
//     try {
//       var url =
//           Uri.parse("${Apiconfig.baseUrl + Apiconfig.fResult}/$id?year=$year");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getSuggestKCCD(id) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.suggetKCCD}/$id");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future getNoteKCCD(idp) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.NoteKCCD}?idp=$idp");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.body;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future updateSuggestKCCD(id, body) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.suggetKCCD}/$id");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response =
//           await http.put(url, headers: headers, body: body);
//       if (response.statusCode == 204) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.statusCode;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future approveSuggestKCCD(iddn) async {
//     try {
//       var url =
//           Uri.parse("${Apiconfig.baseUrl + Apiconfig.ConfirmKCCD}?iddn=$iddn");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.put(url, headers: headers);
//       if (response.statusCode == 204) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.statusCode;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future confirmSTest(body) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.ConfirmSTest}");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response =
//           await http.post(url, headers: headers, body: body);
//       if (response.statusCode == 201) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.statusCode;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future updateXNTG(int? idnv, int? idlh) async {
//     try {
//       var url = Uri.parse(
//           "${Apiconfig.baseUrl + Apiconfig.eXNTG}?idnv=$idnv&idlh=$idlh");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.put(url, headers: headers);
//       if (response.statusCode == 204) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.statusCode;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future updateXNHT(int? idht) async {
//     try {
//       var url = Uri.parse("${Apiconfig.baseUrl + Apiconfig.eXNHT}?idht=$idht");
//       Map<String, String> headers = await listHeaderConfig();
//       http.Response response = await http.put(url, headers: headers);
//       if (response.statusCode == 204) {
//         // ClassroomModel aaa =
//         //     ClassroomModel.fromJson(json.decode(response.body));
//         // print(aaa);
//         return response.statusCode;
//       } else if (response.statusCode == 401) {}
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
