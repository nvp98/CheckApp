// import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import "package:flutter/foundation.dart";

// extension Data on Map<String, TextEditingController> {
//   Map<String, dynamic> data() {
//     final res = <String, dynamic>{};
//     for (MapEntry e in entries) {
//       res.putIfAbsent(e.key, () => e.value?.text);
//     }
//     return res;
//   }
// }

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   bool isLoading = false;
//   String _usname = "";
//   bool _authen = false;

//   // add finger and faceid
//   // late final LocalAuthentication auth;
//   bool _supportState = false;

//   // @override
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final Map<String, TextEditingController> sigUpController = {
//     'MaNV': TextEditingController(),
//     'password': TextEditingController(),
//   };

//   void initData() async {
//     // final manv = await getStore("username");
//     // final auth = await getStoreBool("authen");
//     // final pass = await getStore("password");
//     // setState(() {
//     //   _usname = manv ?? "";
//     //   _authen = auth ?? false;
//     // });
//     // sigUpController["MaNV"] = TextEditingController(text: manv);

//     //check support auth finger and faceid
//   }

//   @override
//   void initState() {
//     initData();
//     // TODO: implement initState
//     super.initState();
//     // auth = LocalAuthentication();
//     // auth.isDeviceSupported().then(
//     //       (bool isSupported) => setState(() {
//     //         _supportState = isSupported;
//     //       }),
//     //     );
//   }

//   onSubmit(BuildContext context) async {
//     try {
//       if (formkey.currentState!.validate()) {
//         setState(() {
//           isLoading = true;
//         });
//         final data = sigUpController.data();
//         final body = {
//           "maNV": data['MaNV'],
//           "password": data['password'],
//         };

//         // var res = await ApiService().postLogin(jsonEncode(body));
//         // if (json.decode(res) != null) {
//         //   final token = json.decode(res)['token'];
//         //   final prefs = await SharedPreferences.getInstance();
//         //   final payloadData =
//         //       utf8.fuse(base64).decode(base64.normalize(token.split('.')[1]));
//         //   final payload = jsonDecode(payloadData);
//         //   prefs.setString('token', token);
//         //   prefs.setInt('ID', int.parse(payload['ID']));
//         //   prefs.setString('Name', payload['HoTen']);
//         //   prefs.setString('MaNV', payload['MaNV']);

//         //   //save user name, password to finger and faceId
//         //   prefs.setString('password', data['password']);
//         //   prefs.setString('username', payload['MaNV']);
//         //   // prefs.setInt('exp', int.parse(payload['exp']));
//         //   Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
//         //       MaterialPageRoute(builder: (context) => Home()),
//         //       (Route<dynamic> route) => false));
//         //   // Navigator.push(context, MaterialPageRoute(builder: (_) => Home())));
//         // }
//         setState(() {
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         // print("Not Validated");
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<void> _authenticate() async {
//     try {
//       final data = sigUpController.data();
//       if (_authen == true && _usname == data['MaNV']) {
//         bool authenticated = await auth.authenticate(
//           localizedReason:
//               'Subcribe or you will never find any stack overflow answer',
//           options: const AuthenticationOptions(
//             stickyAuth: true,
//             biometricOnly: false,
//           ),
//         );
//         final pass = await getStore("password");
//         // print("Authenticated : $authenticated");
//         if (authenticated == true) {
//           sigUpController["password"] = TextEditingController(text: pass);
//           onSubmit(context);
//         }
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return CustomAlert(
//               title: "Thông báo",
//               content:
//                   "Vui lòng đăng nhập ứng dụng để kích hoạt chức năng này!",
//               onTap: () => {Navigator.of(context).pop()},
//             );
//           },
//         );
//       }
//     } on PlatformException catch (e) {
//       print(e);
//     }

//     if (!mounted) {
//       return;
//     }
//     // we can call setState here
//   }

//   Future<void> _getAvailableBiometrics() async {
//     List<BiometricType> availableBiometrics =
//         await auth.getAvailableBiometrics();

//     // print("List of availableBiometrics : $availableBiometrics");

//     if (!mounted) {
//       return;
//     }
//     // than we can call setState
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = Theme.of(context).brightness == Brightness.dark;
//     bool isRtl = context.locale == Constants.arLocal;
//     Future<String> gettoken = getToken();
//     gettoken
//         .then((value) => {
//               if (!value.toString().isEmpty)
//                 {
//                   Future.microtask(() => Navigator.of(context)
//                       .pushAndRemoveUntil(
//                           MaterialPageRoute(builder: (context) => Home()),
//                           (Route<dynamic> route) => false))
//                 }
//             })
//         .catchError((error) => {});

//     return GestureDetector(
//         onTap: () {
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Scaffold(
//           body: SafeArea(
//               child: SizedBox(
//             height: size.height,
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(ImageConstant.bg_class),
//                     colorFilter: ColorFilter.mode(
//                       Colors.white.withOpacity(0.1),
//                       BlendMode.modulate,
//                     ),
//                     fit: BoxFit.cover),
//               ),
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Form(
//                   // width: size.width,
//                   key: formkey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: getPadding(
//                           isRtl: isRtl,
//                           left: 24,
//                           top: 70,
//                           right: 24,
//                         ),
//                         child: CommonImageView(
//                           imagePath: ImageConstant.appLogo,
//                           // height: getVerticalSize(
//                           //   119.00,
//                           // ),
//                           width: getHorizontalSize(
//                             250.00,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: getHorizontalSize(
//                           283.00,
//                         ),
//                         margin: getMargin(
//                           isRtl: isRtl,
//                           left: 24,
//                           top: 30,
//                           right: 24,
//                         ),
//                         child: Text(
//                           "HỆ THỐNG ĐÀO TẠO TRỰC TUYẾN E-LEARNING",
//                           maxLines: null,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: getFontSize(
//                               24,
//                             ),
//                             color: Color.fromARGB(255, 0, 85, 155),
//                             // fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w700,
//                             letterSpacing: 0.36,
//                             height: 1.33,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: getHorizontalSize(
//                           318.00,
//                         ),
//                         margin: getMargin(
//                           isRtl: isRtl,
//                           left: 24,
//                           top: 16,
//                           right: 24,
//                         ),
//                         child: Text(
//                           "Chào mừng bạn đến với hệ thống học tập \n trực tuyến Hòa Phát Dung Quất.",
//                           maxLines: null,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: ColorConstant.bluegray900,
//                             fontSize: getFontSize(
//                               16,
//                             ),
//                             fontFamily: 'Roboto',
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.36,
//                             height: 1.57,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         margin: getMargin(
//                           isRtl: isRtl,
//                           left: 24,
//                           top: 50,
//                           right: 24,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             getHorizontalSize(
//                               2.00,
//                             ),
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Align(
//                               alignment: isRtl
//                                   ? Alignment.centerRight
//                                   : Alignment.centerLeft,
//                               child: Padding(
//                                 padding: getPadding(
//                                   isRtl: isRtl,
//                                   left: 20,
//                                   right: 20,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Padding(
//                                       padding: getPadding(
//                                         isRtl: isRtl,
//                                         top: 2,
//                                       ),
//                                       child: Text(
//                                         "Mã Nhân Viên",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                           color: ColorConstant.bluegray900,
//                                           fontSize: getFontSize(
//                                             16,
//                                           ),
//                                           fontFamily: 'Roboto',
//                                           fontWeight: FontWeight.w500,
//                                           letterSpacing: 1.2,
//                                           height: 1.00,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         isRtl: isRtl,
//                                         bottom: 3,
//                                       ),
//                                       child: Text(
//                                         "*",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                           color: ColorConstant.redA700A2,
//                                           fontSize: getFontSize(
//                                             14,
//                                           ),
//                                           fontFamily: 'Source Sans Pro',
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             CustomTextFormField(
//                               isDark: isDark,
//                               keyboardType: TextInputType.text,
//                               width: 327,
//                               focusNode: FocusNode(),
//                               hintText: "Mã nhân viên",
//                               controller: sigUpController['MaNV'],
//                               margin: getMargin(
//                                 isRtl: isRtl,
//                                 top: 13,
//                               ),
//                               alignment: Alignment.centerLeft,
//                             ),
//                             Align(
//                               alignment: isRtl
//                                   ? Alignment.centerRight
//                                   : Alignment.centerLeft,
//                               child: Padding(
//                                 padding: getPadding(
//                                     isRtl: isRtl, left: 20, right: 20, top: 20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Padding(
//                                       padding: getPadding(
//                                         isRtl: isRtl,
//                                         top: 2,
//                                       ),
//                                       child: Text(
//                                         "Mật Khẩu",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                           color: ColorConstant.bluegray900,
//                                           fontSize: getFontSize(
//                                             16,
//                                           ),
//                                           fontFamily: 'Roboto',
//                                           fontWeight: FontWeight.w500,
//                                           letterSpacing: 1.2,
//                                           height: 1.00,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         isRtl: isRtl,
//                                         bottom: 3,
//                                       ),
//                                       child: Text(
//                                         "*",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                           color: ColorConstant.redA700A2,
//                                           fontSize: getFontSize(
//                                             14,
//                                           ),
//                                           fontFamily: 'Source Sans Pro',
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             CustomTextFormField(
//                               isDark: isDark,
//                               keyboardType: TextInputType.visiblePassword,
//                               controller: sigUpController['password'],
//                               width: 327,
//                               focusNode: FocusNode(),
//                               isObscureText: true,
//                               hintText: "",
//                               margin: getMargin(
//                                 isRtl: isRtl,
//                                 top: 13,
//                               ),
//                               alignment: Alignment.centerLeft,
//                             ),
//                           ],
//                         ),
//                       ),
//                       isLoading == false
//                           ? CustomButton(
//                               width: 328,
//                               text: "Đăng nhập",
//                               margin: getMargin(
//                                 isRtl: isRtl,
//                                 left: 24,
//                                 top: 40,
//                                 right: 23,
//                               ),
//                               onTap: () => onSubmit(context),
//                               // onTap: () {
//                               //   Navigator.of(context).pushAndRemoveUntil(
//                               //       MaterialPageRoute(builder: (context) => Home()),
//                               //       (Route<dynamic> route) => false);
//                               // },
//                             )
//                           : Container(
//                               margin: getMargin(
//                                 isRtl: isRtl,
//                                 left: 24,
//                                 top: 40,
//                                 right: 23,
//                               ),
//                               child: InkWell(
//                                 child: Container(
//                                   width: getHorizontalSize(328),
//                                   padding: getPadding(
//                                     all: 16,
//                                   ),
//                                   decoration: BoxDecoration(
//                                       color: ColorConstant.blueHP,
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           24.00,
//                                         ),
//                                       )),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       Text(
//                                         'Loading...',
//                                         style: TextStyle(
//                                             fontSize: 20, color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       SizedBox(
//                                         child: Center(
//                                             child: CircularProgressIndicator(
//                                           color: Colors.white,
//                                         )),
//                                         height: 15.0,
//                                         width: 15.0,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                       ElevatedButton(
//                         onPressed: _authenticate,
//                         child: defaultTargetPlatform == TargetPlatform.iOS
//                             ? Image.asset(
//                                 ImageConstant.faceid,
//                                 width: 50,
//                                 height: 50,
//                               )
//                             : Icon(
//                                 Icons.fingerprint,
//                                 size: 50,
//                                 color: Colors.black,
//                               ),
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent),
//                       ),
//                       // ElevatedButton(
//                       //   onPressed: _getAvailableBiometrics,
//                       //   child: const Text('Get available biometrics'),
//                       // ),
//                       Container(
//                         width: getHorizontalSize(
//                           318.00,
//                         ),
//                         margin: getMargin(
//                             isRtl: isRtl, left: 24, top: 70, right: 24),
//                         child: Text(
//                           "Copyright ©2023 Ban Công nghệ thông tin.\n Công ty CP Thép Hòa Phát Dung Quất",
//                           maxLines: null,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: ColorConstant.bluegray900,
//                             fontSize: getFontSize(
//                               14,
//                             ),
//                             fontFamily: 'Roboto',
//                             fontWeight: FontWeight.w500,
//                             // letterSpacing: 0.5,
//                             height: 1.57,
//                           ),
//                         ),
//                       ),
//                       // Container(
//                       //   margin: getMargin(
//                       //     isRtl: isRtl,
//                       //     left: 20,
//                       //     top: 40,
//                       //     right: 20,
//                       //     bottom: 20,
//                       //   ),
//                       //   decoration: BoxDecoration(),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //     crossAxisAlignment: CrossAxisAlignment.center,
//                       //     mainAxisSize: MainAxisSize.max,
//                       //     children: [
//                       //       Container(
//                       //         width: getHorizontalSize(150),
//                       //         margin: getMargin(
//                       //           isRtl: isRtl,
//                       //           left: 0,
//                       //         ),
//                       //         decoration: BoxDecoration(
//                       //           color: isDark
//                       //               ? ColorConstant.darkTextField
//                       //               : ColorConstant.whiteA700,
//                       //           borderRadius: BorderRadius.circular(
//                       //             getHorizontalSize(
//                       //               24.00,
//                       //             ),
//                       //           ),
//                       //           boxShadow: [
//                       //             BoxShadow(
//                       //               color: ColorConstant.indigoA20014,
//                       //               spreadRadius: getHorizontalSize(
//                       //                 0.00,
//                       //               ),
//                       //               blurRadius: getHorizontalSize(
//                       //                 10.00,
//                       //               ),
//                       //               offset: Offset(
//                       //                 0,
//                       //                 4,
//                       //               ),
//                       //             ),
//                       //           ],
//                       //         ),
//                       //         child: Align(
//                       //           alignment: Alignment.center,
//                       //           child: Row(
//                       //             crossAxisAlignment: CrossAxisAlignment.center,
//                       //             mainAxisSize: MainAxisSize.min,
//                       //             children: [
//                       //               Padding(
//                       //                 padding: getPadding(
//                       //                   isRtl: isRtl,
//                       //                   left: 0,
//                       //                   top: 12,
//                       //                   bottom: 12,
//                       //                 ),
//                       //                 child: CommonImageView(
//                       //                   svgPath: ImageConstant.imgFacebook,
//                       //                   height: getVerticalSize(
//                       //                     24.00,
//                       //                   ),
//                       //                   width: getHorizontalSize(
//                       //                     23.00,
//                       //                   ),
//                       //                 ),
//                       //               ),
//                       //               Padding(
//                       //                 padding: getPadding(
//                       //                   isRtl: isRtl,
//                       //                   left: 12,
//                       //                   top: 18,
//                       //                   right: 0,
//                       //                   bottom: 12,
//                       //                 ),
//                       //                 child: Text(
//                       //                   "Facebook",
//                       //                   overflow: TextOverflow.ellipsis,
//                       //                   textAlign: TextAlign.start,
//                       //                   style: TextStyle(
//                       //                     fontSize: getFontSize(
//                       //                       16,
//                       //                     ),
//                       //                     fontFamily: 'Poppins',
//                       //                     fontWeight: FontWeight.w500,
//                       //                     height: 1.00,
//                       //                   ),
//                       //                 ),
//                       //               ),
//                       //             ],
//                       //           ),
//                       //         ),
//                       //       ),
//                       //       // Container(
//                       //       //   width: getHorizontalSize(150),
//                       //       //   margin: getMargin(
//                       //       //     isRtl: isRtl,
//                       //       //     left: 0,
//                       //       //   ),
//                       //       //   decoration: BoxDecoration(
//                       //       //     color: isDark
//                       //       //         ? ColorConstant.darkTextField
//                       //       //         : ColorConstant.whiteA700,
//                       //       //     borderRadius: BorderRadius.circular(
//                       //       //       getHorizontalSize(
//                       //       //         24.00,
//                       //       //       ),
//                       //       //     ),
//                       //       //     boxShadow: [
//                       //       //       BoxShadow(
//                       //       //         color: ColorConstant.indigoA20014,
//                       //       //         spreadRadius: getHorizontalSize(
//                       //       //           0.00,
//                       //       //         ),
//                       //       //         blurRadius: getHorizontalSize(
//                       //       //           10.00,
//                       //       //         ),
//                       //       //         offset: Offset(
//                       //       //           0,
//                       //       //           4,
//                       //       //         ),
//                       //       //       ),
//                       //       //     ],
//                       //       //   ),
//                       //       //   child: Align(
//                       //       //     alignment: Alignment.center,
//                       //       //     child: Row(
//                       //       //       crossAxisAlignment: CrossAxisAlignment.center,
//                       //       //       mainAxisSize: MainAxisSize.min,
//                       //       //       children: [
//                       //       //         Padding(
//                       //       //           padding: getPadding(
//                       //       //             isRtl: isRtl,
//                       //       //             left: 0,
//                       //       //             top: 12,
//                       //       //             bottom: 12,
//                       //       //           ),
//                       //       //           child: CommonImageView(
//                       //       //             svgPath: ImageConstant.imgGoogle,
//                       //       //             height: getVerticalSize(
//                       //       //               24.00,
//                       //       //             ),
//                       //       //             width: getHorizontalSize(
//                       //       //               23.00,
//                       //       //             ),
//                       //       //           ),
//                       //       //         ),
//                       //       //         Padding(
//                       //       //           padding: getPadding(
//                       //       //             isRtl: isRtl,
//                       //       //             left: 12,
//                       //       //             top: 18,
//                       //       //             right: 0,
//                       //       //             bottom: 12,
//                       //       //           ),
//                       //       //           child: Text(
//                       //       //             "Google",
//                       //       //             overflow: TextOverflow.ellipsis,
//                       //       //             textAlign: TextAlign.start,
//                       //       //             style: TextStyle(
//                       //       //               fontSize: getFontSize(
//                       //       //                 16,
//                       //       //               ),
//                       //       //               fontFamily: 'Poppins',
//                       //       //               fontWeight: FontWeight.w500,
//                       //       //               height: 1.00,
//                       //       //             ),
//                       //       //           ),
//                       //       //         ),
//                       //       //       ],
//                       //       //     ),
//                       //       //   ),
//                       //       // ),
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )),
//         ));
//   }
// }

// // class SignInScreen extends StatelessWidget {
// //   @override
// //   GlobalKey<FormState> formkey = GlobalKey<FormState>();
// //   final Map<String, TextEditingController> sigUpController = {
// //     'MaNV': TextEditingController(),
// //     'password': TextEditingController(),
// //   };

// //   onSubmit(BuildContext context) async {
// //     if (formkey.currentState!.validate()) {
// //       final data = sigUpController.data();
// //       final body = {
// //         "maNV": data['MaNV'],
// //         "password": data['password'],
// //       };
// //       var res = await ApiService().postLogin(jsonEncode(body));
// //       if (json.decode(res) != null) {
// //         final token = json.decode(res)['token'];
// //         final prefs = await SharedPreferences.getInstance();
// //         final payloadData =
// //             utf8.fuse(base64).decode(base64.normalize(token.split('.')[1]));
// //         final payload = jsonDecode(payloadData);
// //         prefs.setString('token', token);
// //         prefs.setInt('ID', int.parse(payload['ID']));
// //         prefs.setString('Name', payload['HoTen']);
// //         prefs.setString('MaNV', payload['MaNV']);
// //         // prefs.setInt('exp', int.parse(payload['exp']));
// //         Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
// //             MaterialPageRoute(builder: (context) => Home()),
// //             (Route<dynamic> route) => false));
// //         // Navigator.push(context, MaterialPageRoute(builder: (_) => Home())));
// //       }
// //     } else {
// //       print("Not Validated");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {

// //     bool isDark = Theme.of(context).brightness == Brightness.dark;
// //     bool isRtl = context.locale == Constants.arLocal;
// //     Future<String> gettoken = getToken();
// //     gettoken
// //         .then((value) => {
// //               if (!value.toString().isEmpty)
// //                 {
// //                   Future.microtask(() => Navigator.of(context)
// //                       .pushAndRemoveUntil(
// //                           MaterialPageRoute(builder: (context) => Home()),
// //                           (Route<dynamic> route) => false))
// //                 }
// //             })
// //         .catchError((error) => {});

// //     return Scaffold(
// //       body: SafeArea(
// //           child: SizedBox(
// //         height: size.height,
// //         child: DecoratedBox(
// //           decoration: BoxDecoration(
// //             image: DecorationImage(
// //                 image: AssetImage(ImageConstant.bg_class),
// //                 colorFilter: ColorFilter.mode(
// //                   Colors.white.withOpacity(0.1),
// //                   BlendMode.modulate,
// //                 ),
// //                 fit: BoxFit.cover),
// //           ),
// //           child: SingleChildScrollView(
// //             physics: BouncingScrollPhysics(),
// //             child: Form(
// //               // width: size.width,
// //               key: formkey,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: getPadding(
// //                       isRtl: isRtl,
// //                       left: 24,
// //                       top: 70,
// //                       right: 24,
// //                     ),
// //                     child: CommonImageView(
// //                       imagePath: ImageConstant.appLogo,
// //                       // height: getVerticalSize(
// //                       //   119.00,
// //                       // ),
// //                       width: getHorizontalSize(
// //                         250.00,
// //                       ),
// //                     ),
// //                   ),
// //                   Container(
// //                     width: getHorizontalSize(
// //                       283.00,
// //                     ),
// //                     margin: getMargin(
// //                       isRtl: isRtl,
// //                       left: 24,
// //                       top: 30,
// //                       right: 24,
// //                     ),
// //                     child: Text(
// //                       "HỆ THỐNG ĐÀO TẠO TRỰC TUYẾN E-LEARNING",
// //                       maxLines: null,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontSize: getFontSize(
// //                           24,
// //                         ),
// //                         color: Color.fromARGB(255, 0, 85, 155),
// //                         // fontFamily: 'Poppins',
// //                         fontWeight: FontWeight.w700,
// //                         letterSpacing: 0.36,
// //                         height: 1.33,
// //                       ),
// //                     ),
// //                   ),
// //                   Container(
// //                     width: getHorizontalSize(
// //                       318.00,
// //                     ),
// //                     margin: getMargin(
// //                       isRtl: isRtl,
// //                       left: 24,
// //                       top: 16,
// //                       right: 24,
// //                     ),
// //                     child: Text(
// //                       "Chào mừng bạn đến với hệ thống học tập \n trực tuyến Hòa Phát Dung Quất.",
// //                       maxLines: null,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: ColorConstant.bluegray900,
// //                         fontSize: getFontSize(
// //                           16,
// //                         ),
// //                         fontFamily: 'Roboto',
// //                         fontWeight: FontWeight.w500,
// //                         letterSpacing: 0.36,
// //                         height: 1.57,
// //                       ),
// //                     ),
// //                   ),
// //                   Container(
// //                     width: double.infinity,
// //                     margin: getMargin(
// //                       isRtl: isRtl,
// //                       left: 24,
// //                       top: 50,
// //                       right: 24,
// //                     ),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(
// //                         getHorizontalSize(
// //                           2.00,
// //                         ),
// //                       ),
// //                     ),
// //                     child: Column(
// //                       mainAxisSize: MainAxisSize.min,
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         Align(
// //                           alignment: isRtl
// //                               ? Alignment.centerRight
// //                               : Alignment.centerLeft,
// //                           child: Padding(
// //                             padding: getPadding(
// //                               isRtl: isRtl,
// //                               left: 20,
// //                               right: 20,
// //                             ),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 Padding(
// //                                   padding: getPadding(
// //                                     isRtl: isRtl,
// //                                     top: 2,
// //                                   ),
// //                                   child: Text(
// //                                     "Mã Nhân Viên",
// //                                     overflow: TextOverflow.ellipsis,
// //                                     textAlign: TextAlign.start,
// //                                     style: TextStyle(
// //                                       color: ColorConstant.bluegray900,
// //                                       fontSize: getFontSize(
// //                                         16,
// //                                       ),
// //                                       fontFamily: 'Roboto',
// //                                       fontWeight: FontWeight.w500,
// //                                       letterSpacing: 1.2,
// //                                       height: 1.00,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: getPadding(
// //                                     isRtl: isRtl,
// //                                     bottom: 3,
// //                                   ),
// //                                   child: Text(
// //                                     "*",
// //                                     overflow: TextOverflow.ellipsis,
// //                                     textAlign: TextAlign.start,
// //                                     style: TextStyle(
// //                                       color: ColorConstant.redA700A2,
// //                                       fontSize: getFontSize(
// //                                         14,
// //                                       ),
// //                                       fontFamily: 'Source Sans Pro',
// //                                       fontWeight: FontWeight.w600,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         CustomTextFormField(
// //                           isDark: isDark,
// //                           keyboardType: TextInputType.text,
// //                           width: 327,
// //                           focusNode: FocusNode(),
// //                           hintText: "Mã nhân viên",
// //                           controller: sigUpController['MaNV'],
// //                           margin: getMargin(
// //                             isRtl: isRtl,
// //                             top: 13,
// //                           ),
// //                           alignment: Alignment.centerLeft,
// //                         ),
// //                         Align(
// //                           alignment: isRtl
// //                               ? Alignment.centerRight
// //                               : Alignment.centerLeft,
// //                           child: Padding(
// //                             padding: getPadding(
// //                                 isRtl: isRtl, left: 20, right: 20, top: 20),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 Padding(
// //                                   padding: getPadding(
// //                                     isRtl: isRtl,
// //                                     top: 2,
// //                                   ),
// //                                   child: Text(
// //                                     "Mật Khẩu",
// //                                     overflow: TextOverflow.ellipsis,
// //                                     textAlign: TextAlign.start,
// //                                     style: TextStyle(
// //                                       color: ColorConstant.bluegray900,
// //                                       fontSize: getFontSize(
// //                                         16,
// //                                       ),
// //                                       fontFamily: 'Roboto',
// //                                       fontWeight: FontWeight.w500,
// //                                       letterSpacing: 1.2,
// //                                       height: 1.00,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: getPadding(
// //                                     isRtl: isRtl,
// //                                     bottom: 3,
// //                                   ),
// //                                   child: Text(
// //                                     "*",
// //                                     overflow: TextOverflow.ellipsis,
// //                                     textAlign: TextAlign.start,
// //                                     style: TextStyle(
// //                                       color: ColorConstant.redA700A2,
// //                                       fontSize: getFontSize(
// //                                         14,
// //                                       ),
// //                                       fontFamily: 'Source Sans Pro',
// //                                       fontWeight: FontWeight.w600,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         CustomTextFormField(
// //                           isDark: isDark,
// //                           keyboardType: TextInputType.visiblePassword,
// //                           controller: sigUpController['password'],
// //                           width: 327,
// //                           focusNode: FocusNode(),
// //                           isObscureText: true,
// //                           hintText: "",
// //                           margin: getMargin(
// //                             isRtl: isRtl,
// //                             top: 13,
// //                           ),
// //                           alignment: Alignment.centerLeft,
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   isLoading == false
// //                       ? CustomButton(
// //                           width: 328,
// //                           text: "Đăng nhập",
// //                           margin: getMargin(
// //                             isRtl: isRtl,
// //                             left: 24,
// //                             top: 40,
// //                             right: 23,
// //                           ),
// //                           onTap: () => onSubmit(context),
// //                           // onTap: () {
// //                           //   Navigator.of(context).pushAndRemoveUntil(
// //                           //       MaterialPageRoute(builder: (context) => Home()),
// //                           //       (Route<dynamic> route) => false);
// //                           // },
// //                         )
// //                       : Container(
// //                           margin: getMargin(
// //                             isRtl: isRtl,
// //                             left: 24,
// //                             top: 40,
// //                             right: 23,
// //                           ),
// //                           child: InkWell(
// //                             child: Container(
// //                               width: getHorizontalSize(328),
// //                               padding: getPadding(
// //                                 all: 16,
// //                               ),
// //                               decoration: BoxDecoration(
// //                                   color: ColorConstant.blueHP,
// //                                   borderRadius: BorderRadius.circular(
// //                                     getHorizontalSize(
// //                                       24.00,
// //                                     ),
// //                                   )),
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: const [
// //                                   Text(
// //                                     'Loading...',
// //                                     style: TextStyle(
// //                                         fontSize: 20, color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     width: 10,
// //                                   ),
// //                                   SizedBox(
// //                                     child: Center(
// //                                         child: CircularProgressIndicator(
// //                                       color: Colors.white,
// //                                     )),
// //                                     height: 15.0,
// //                                     width: 15.0,
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                   Container(
// //                     width: getHorizontalSize(
// //                       318.00,
// //                     ),
// //                     margin:
// //                         getMargin(isRtl: isRtl, left: 24, top: 70, right: 24),
// //                     child: Text(
// //                       "Copyright ©2023 Ban Công nghệ thông tin.\n Công ty CP Thép Hòa Phát Dung Quất",
// //                       maxLines: null,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: ColorConstant.bluegray900,
// //                         fontSize: getFontSize(
// //                           14,
// //                         ),
// //                         fontFamily: 'Roboto',
// //                         fontWeight: FontWeight.w500,
// //                         // letterSpacing: 0.5,
// //                         height: 1.57,
// //                       ),
// //                     ),
// //                   ),
// //                   // Container(
// //                   //   margin: getMargin(
// //                   //     isRtl: isRtl,
// //                   //     left: 20,
// //                   //     top: 40,
// //                   //     right: 20,
// //                   //     bottom: 20,
// //                   //   ),
// //                   //   decoration: BoxDecoration(),
// //                   //   child: Row(
// //                   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   //     crossAxisAlignment: CrossAxisAlignment.center,
// //                   //     mainAxisSize: MainAxisSize.max,
// //                   //     children: [
// //                   //       Container(
// //                   //         width: getHorizontalSize(150),
// //                   //         margin: getMargin(
// //                   //           isRtl: isRtl,
// //                   //           left: 0,
// //                   //         ),
// //                   //         decoration: BoxDecoration(
// //                   //           color: isDark
// //                   //               ? ColorConstant.darkTextField
// //                   //               : ColorConstant.whiteA700,
// //                   //           borderRadius: BorderRadius.circular(
// //                   //             getHorizontalSize(
// //                   //               24.00,
// //                   //             ),
// //                   //           ),
// //                   //           boxShadow: [
// //                   //             BoxShadow(
// //                   //               color: ColorConstant.indigoA20014,
// //                   //               spreadRadius: getHorizontalSize(
// //                   //                 0.00,
// //                   //               ),
// //                   //               blurRadius: getHorizontalSize(
// //                   //                 10.00,
// //                   //               ),
// //                   //               offset: Offset(
// //                   //                 0,
// //                   //                 4,
// //                   //               ),
// //                   //             ),
// //                   //           ],
// //                   //         ),
// //                   //         child: Align(
// //                   //           alignment: Alignment.center,
// //                   //           child: Row(
// //                   //             crossAxisAlignment: CrossAxisAlignment.center,
// //                   //             mainAxisSize: MainAxisSize.min,
// //                   //             children: [
// //                   //               Padding(
// //                   //                 padding: getPadding(
// //                   //                   isRtl: isRtl,
// //                   //                   left: 0,
// //                   //                   top: 12,
// //                   //                   bottom: 12,
// //                   //                 ),
// //                   //                 child: CommonImageView(
// //                   //                   svgPath: ImageConstant.imgFacebook,
// //                   //                   height: getVerticalSize(
// //                   //                     24.00,
// //                   //                   ),
// //                   //                   width: getHorizontalSize(
// //                   //                     23.00,
// //                   //                   ),
// //                   //                 ),
// //                   //               ),
// //                   //               Padding(
// //                   //                 padding: getPadding(
// //                   //                   isRtl: isRtl,
// //                   //                   left: 12,
// //                   //                   top: 18,
// //                   //                   right: 0,
// //                   //                   bottom: 12,
// //                   //                 ),
// //                   //                 child: Text(
// //                   //                   "Facebook",
// //                   //                   overflow: TextOverflow.ellipsis,
// //                   //                   textAlign: TextAlign.start,
// //                   //                   style: TextStyle(
// //                   //                     fontSize: getFontSize(
// //                   //                       16,
// //                   //                     ),
// //                   //                     fontFamily: 'Poppins',
// //                   //                     fontWeight: FontWeight.w500,
// //                   //                     height: 1.00,
// //                   //                   ),
// //                   //                 ),
// //                   //               ),
// //                   //             ],
// //                   //           ),
// //                   //         ),
// //                   //       ),
// //                   //       // Container(
// //                   //       //   width: getHorizontalSize(150),
// //                   //       //   margin: getMargin(
// //                   //       //     isRtl: isRtl,
// //                   //       //     left: 0,
// //                   //       //   ),
// //                   //       //   decoration: BoxDecoration(
// //                   //       //     color: isDark
// //                   //       //         ? ColorConstant.darkTextField
// //                   //       //         : ColorConstant.whiteA700,
// //                   //       //     borderRadius: BorderRadius.circular(
// //                   //       //       getHorizontalSize(
// //                   //       //         24.00,
// //                   //       //       ),
// //                   //       //     ),
// //                   //       //     boxShadow: [
// //                   //       //       BoxShadow(
// //                   //       //         color: ColorConstant.indigoA20014,
// //                   //       //         spreadRadius: getHorizontalSize(
// //                   //       //           0.00,
// //                   //       //         ),
// //                   //       //         blurRadius: getHorizontalSize(
// //                   //       //           10.00,
// //                   //       //         ),
// //                   //       //         offset: Offset(
// //                   //       //           0,
// //                   //       //           4,
// //                   //       //         ),
// //                   //       //       ),
// //                   //       //     ],
// //                   //       //   ),
// //                   //       //   child: Align(
// //                   //       //     alignment: Alignment.center,
// //                   //       //     child: Row(
// //                   //       //       crossAxisAlignment: CrossAxisAlignment.center,
// //                   //       //       mainAxisSize: MainAxisSize.min,
// //                   //       //       children: [
// //                   //       //         Padding(
// //                   //       //           padding: getPadding(
// //                   //       //             isRtl: isRtl,
// //                   //       //             left: 0,
// //                   //       //             top: 12,
// //                   //       //             bottom: 12,
// //                   //       //           ),
// //                   //       //           child: CommonImageView(
// //                   //       //             svgPath: ImageConstant.imgGoogle,
// //                   //       //             height: getVerticalSize(
// //                   //       //               24.00,
// //                   //       //             ),
// //                   //       //             width: getHorizontalSize(
// //                   //       //               23.00,
// //                   //       //             ),
// //                   //       //           ),
// //                   //       //         ),
// //                   //       //         Padding(
// //                   //       //           padding: getPadding(
// //                   //       //             isRtl: isRtl,
// //                   //       //             left: 12,
// //                   //       //             top: 18,
// //                   //       //             right: 0,
// //                   //       //             bottom: 12,
// //                   //       //           ),
// //                   //       //           child: Text(
// //                   //       //             "Google",
// //                   //       //             overflow: TextOverflow.ellipsis,
// //                   //       //             textAlign: TextAlign.start,
// //                   //       //             style: TextStyle(
// //                   //       //               fontSize: getFontSize(
// //                   //       //                 16,
// //                   //       //               ),
// //                   //       //               fontFamily: 'Poppins',
// //                   //       //               fontWeight: FontWeight.w500,
// //                   //       //               height: 1.00,
// //                   //       //             ),
// //                   //       //           ),
// //                   //       //         ),
// //                   //       //       ],
// //                   //       //     ),
// //                   //       //   ),
// //                   //       // ),
// //                   //     ],
// //                   //   ),
// //                   // ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       )),
// //     );
// //   }
// // }
