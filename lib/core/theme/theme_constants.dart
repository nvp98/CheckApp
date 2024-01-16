// import 'package:flutter/material.dart';
// import 'package:mystic_academy/core/app_export.dart';
// import 'package:flutter/services.dart';

// ThemeData lightTheme = ThemeData(
//   primaryColor: Colors.black,
//   dialogTheme: DialogTheme(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(getHorizontalSize(10))),
//       backgroundColor: Colors.white),
//   scaffoldBackgroundColor: ColorConstant.gray50,
//   appBarTheme: AppBarTheme(
//       backgroundColor: ColorConstant.whiteA700, foregroundColor: Colors.black),
//   brightness: Brightness.light,
//   bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor: ColorConstant.whiteA700,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//       top: Radius.circular(20),
//     )),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     alignLabelWithHint: true,
//     hintStyle: TextStyle(
//       color: ColorConstant.bluegray300,
//       fontSize: getFontSize(
//         16,
//       ),
//       fontFamily: 'Poppins',
//       fontWeight: FontWeight.w400,
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//         getHorizontalSize(
//           50.00,
//         ),
//       ),
//       borderSide: BorderSide.none,
//     ),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(
//           getHorizontalSize(
//             50.00,
//           ),
//         ),
//         borderSide: BorderSide.none),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(50),
//       borderSide: BorderSide(
//         color: ColorConstant.indigoA200,
//         width: 1,
//       ),
//     ),
//     filled: true,
//     fillColor: ColorConstant.gray100,
//     isDense: true,
//     contentPadding: EdgeInsets.only(
//       left: getHorizontalSize(
//         14.00,
//       ),
//       right: getHorizontalSize(
//         14.00,
//       ),
//       top: getVerticalSize(
//         50.11,
//       ),
//       bottom: getVerticalSize(
//         0.12,
//       ),
//     ),
//   ),
// );

// ThemeData darkTheme = ThemeData(
//   dialogTheme: DialogTheme(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(getHorizontalSize(10))),
//       backgroundColor: ColorConstant.darkBg),
//   scaffoldBackgroundColor: ColorConstant.darkBg,
//   tabBarTheme: TabBarTheme(),
//   appBarTheme: AppBarTheme(
//       // backgroundColor: ColorConstant.darkBg,
//       foregroundColor: Colors.white),
//   brightness: Brightness.dark,
//   inputDecorationTheme: InputDecorationTheme(
//     hintStyle: TextStyle(
//       color: ColorConstant.bluegray300,
//       fontSize: getFontSize(
//         16,
//       ),
//       fontFamily: 'Poppins',
//       fontWeight: FontWeight.w400,
//     ),
//     filled: true,
//     fillColor: ColorConstant.darkTextField,
//     contentPadding: EdgeInsets.only(
//       left: getHorizontalSize(
//         14.00,
//       ),
//       right: getHorizontalSize(
//         14.00,
//       ),
//       top: getVerticalSize(
//         50.11,
//       ),
//       bottom: getVerticalSize(
//         0.12,
//       ),
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//         getHorizontalSize(
//           50.00,
//         ),
//       ),
//       borderSide: BorderSide.none,
//     ),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(
//           getHorizontalSize(
//             50.00,
//           ),
//         ),
//         borderSide: BorderSide.none),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(50),
//       borderSide: BorderSide(
//         color: ColorConstant.indigoA200,
//         width: 1,
//       ),
//     ),
//   ),
//   bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor: ColorConstant.darkTextField,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//       top: Radius.circular(20),
//     )),
//   ),
// );

// Widget darkCustomContainer(
//     {required Widget child,
//     EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 1)}) {
//   return Container(
//       padding: padding,
//       margin: EdgeInsets.only(
//         bottom: getVerticalSize(8),
//       ),
//       decoration: BoxDecoration(
//         // color: ColorConstant.darkButton,
//         borderRadius: BorderRadius.circular(
//           getHorizontalSize(
//             20.00,
//           ),
//         ),
//       ),
//       child: child);
// }
