// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? actions;
//   final Widget? leading;

//   CustomNavBar({
//     required this.title,
//     this.actions,
//     this.leading,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS ? _buildCupertinoNavigationBar() : _buildMaterialAppBar();
//   }

//   // CupertinoNavigationBar for iOS
//   Widget _buildCupertinoNavigationBar() {
//     return CupertinoNavigationBar(
//       middle: Text(title),
//       leading: leading,
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: actions ?? [],
//       ),
//     );
//   }

//   // AppBar for Android
//   Widget _buildMaterialAppBar() {
//     return AppBar(
//       title: Text(title),
//       leading: leading,
//       actions: actions,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
