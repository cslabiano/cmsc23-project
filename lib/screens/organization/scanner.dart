import 'dart:typed_data';

import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class Scanner extends StatelessWidget {
  final String orgId;
  const Scanner({required this.orgId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scan QR Code"),
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
                    .read<DonationProvider>()
                    .changeStatus(itemId!, "Completed", orgId);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Successfully changed the status!")));
              }
            },
            controller: MobileScannerController(
                returnImage: true,
                detectionSpeed: DetectionSpeed.noDuplicates)));
  }
}
