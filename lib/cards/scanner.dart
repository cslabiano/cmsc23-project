import 'dart:typed_data';

import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scan QR Code"),
          actions: [
            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () {},
            )
          ],
        ),
        body: MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                print("Barcode found! ${barcode.rawValue}");
              }

              if (image != null) {
                String? itemId = barcodes.first.rawValue;

                context
                    .watch<DonationProvider>()
                    .changeStatus(itemId!, "Confirmed");
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text(barcodes.first.rawValue ?? ""));
                    });
              }
            },
            controller: MobileScannerController(
                returnImage: true,
                detectionSpeed: DetectionSpeed.noDuplicates)));
  }
}
