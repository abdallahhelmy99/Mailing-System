import 'package:flutter/material.dart';

class SharedWidgets {
  AppBar appBar(double toolBarHeight,
      [dynamic titleContent, dynamic actionsContent, dynamic leadingContent]) {
    return AppBar(
        title: titleContent,
        leading: leadingContent,
        toolbarHeight: toolBarHeight,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black,
        elevation: 40,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.grey],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        actions: actionsContent);
  }
}
