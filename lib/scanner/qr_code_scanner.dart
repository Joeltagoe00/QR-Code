import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({super.key});

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  String qrResult = 'Scanned Data will appear here';
  Future<void> scanQR()async{
    try{
      final qrcode = await FlutterBarcodeScanner. scanBarcode('#ff6666', 'Cancel Now', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult = qrcode.toString();
      });

    }on PlatformException{
       qrResult = 'Fail to read QR Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(
              height: 30,
            ),
             Text(qrResult,style: TextStyle(color:Colors.black),),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: scanQR, child: Text('Scan Code Here !')),

            
          ],
        ),
      ),
    );
  }
}