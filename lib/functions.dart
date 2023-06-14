import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

class UsualFunctions {
  static Future openDialog(
      BuildContext context, List<List> menuItemList, double appBarHeightSize) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1, appBarHeightSize, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      items: [
        for (final element in menuItemList) _buildPopMenuItem(context, element),
      ],
    );
  }

  static PopupMenuItem _buildPopMenuItem(BuildContext context, List item) {
    return PopupMenuItem(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => item[2]),
            ),
          );
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item[0],
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              item[1],
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Comfortaa_bold',
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FingerPrintScanner {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> isBiometricSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authentication() async {
    final isAvailable = await hasBiometrics();
    final isbBiometricSupported = await isBiometricSupported();
    if (!isAvailable && !isbBiometricSupported) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}

class Config{
  static final String apiKey = "ega5cqgrdrth";

  static final String tokenH = "7wwhnccww44je594h9zvbwatv2xge49wuryhj63wyfnxc9ufkd2afqe44yt3zzub";
}