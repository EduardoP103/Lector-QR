import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: _launchUrl,
              child: Text('CAMARA QR', style: TextStyle(fontSize: 29))),
        ),
      ),
    );
  }

  void _launchUrl() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#3D8BEF', 'CANCELAR', false, ScanMode.QR);

    print(barcodeScanRes);
    if (!await launch(barcodeScanRes)) throw 'No se pudo ir a  $barcodeScanRes';
  }
}
