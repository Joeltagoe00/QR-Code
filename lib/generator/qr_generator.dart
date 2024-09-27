import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({super.key});

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate your QR Code Here !'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(urlController.text.isNotEmpty)
          QrImageView(data: urlController.text,size:200,),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10
            ),
            child: TextField (
              controller: urlController,
              decoration: InputDecoration(
                hintText: 'Enter your data !',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10
            ),
            ElevatedButton(onPressed: (){setState(() {
              
            });}, child: Text('Generate QR Code Here!')), 
        ],
      ),
    );
  }
}