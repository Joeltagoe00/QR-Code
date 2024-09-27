import 'package:flutter/material.dart';
import 'package:qr_code_3/generator/qr_generator.dart';
import 'package:qr_code_3/scanner/qr_code_scanner.dart';





class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner and Generator'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => QRCodeScanner()));
              });
            }, child: Text('Scan Code Here')),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => QRGenerator(),));
              });
            }, child: Text('Generate Code Here')),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}