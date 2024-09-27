import 'package:flutter/material.dart';

navigateTo(context,newview){
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newview));
}

navigateWithTeplacement(context,newView){
   Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newView));
}

pushAndRemoveUntil(BuildContext context, Widget newView) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => newView,
      ),
      (route) => false);
}
