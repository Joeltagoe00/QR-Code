import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encrypted QR Code Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EncryptedQRCodeGenerator(),
    );
  }
}

class EncryptedQRCodeGenerator extends StatefulWidget {
  @override
  _EncryptedQRCodeGeneratorState createState() => _EncryptedQRCodeGeneratorState();
}

class _EncryptedQRCodeGeneratorState extends State<EncryptedQRCodeGenerator> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  String _encryptedData = '';

  void _generateQRCode() {
    final data = _messageController.text;
    final encryptionKey = _keyController.text;

    if (data.isEmpty || encryptionKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both message and encryption key')),
      );
      return;
    }

    final key = encrypt.Key.fromUtf8(encryptionKey.padRight(32, '0'));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(data, iv: iv);
    setState(() {
      _encryptedData = encrypted.base64;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Encrypted QR Code Generator')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Enter your message'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _keyController,
              decoration: InputDecoration(labelText: 'Enter encryption key'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: Text('Generate Encrypted QR Code'),
            ),
            SizedBox(height: 24),
            if (_encryptedData.isNotEmpty) ...[
              QrImageView(
                data: _encryptedData,
                version: QrVersions.auto,
                size: 200,
              ),
              SizedBox(height: 16),
              Text('Encrypted Data: $_encryptedData', 
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}