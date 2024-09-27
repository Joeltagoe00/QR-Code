import 'package:flutter/material.dart';
import 'package:qr_code_3/src/app.dart';

void main (){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      home:  QRScanner(),
    );
  }
}