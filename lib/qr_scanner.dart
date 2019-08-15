import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QRcode extends StatefulWidget {
  @override
  _QRcodeState createState() => _QRcodeState();
}

class _QRcodeState extends State<QRcode> {
  String result = "Please Start your Journey by scanning the QR Code";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "Please scan the QR Code Again";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    } 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF351C75),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(
            fontSize: 30.0, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}