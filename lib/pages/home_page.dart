import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:untitled5/main.dart';
import 'package:untitled5/res/app_icons.dart';
import 'package:untitled5/res/app_vectorial_images.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes scans'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              String? barcode = await SimpleBarcodeScanner.scanBarcode(
                context,
                barcodeAppBar: const BarcodeAppBar(
                  appBarTitle: 'Test',
                  centerTitle: false,
                  enableBackButton: true,
                  backButtonIcon: Icon(Icons.arrow_back_ios),
                ),
                isShowFlashIcon: true,
                delayMillis: 2000,
                cameraFace: CameraFace.back,
              );

              if (barcode?.isNotEmpty == true && context.mounted) {
                GoRouter.of(context).push(
                  '/product',
                  extra: barcode!,
                );
              }
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              SvgPicture.asset(AppVectorialImages.illEmpty),
              const Spacer(flex: 3),
              const Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    '/product',
                    extra: '5000159484695',
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context)
                      .extension<MyAppThemeExtension>()!
                      .primaryColor,
                  backgroundColor: Theme.of(context)
                      .extension<MyAppThemeExtension>()!
                      .secondaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Commencer'.toUpperCase()),
                    const SizedBox(height: 10.0),
                    const Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
