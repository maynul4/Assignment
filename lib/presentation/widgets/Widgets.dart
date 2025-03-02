import 'package:flutter/material.dart';

snackBarMsg(context, msg){
 return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg))
  );
}