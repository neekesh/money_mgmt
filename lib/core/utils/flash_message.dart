import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showSuccess(
  String message,
  BuildContext context,
) {
  return showFlash(
    duration: const Duration(seconds: 4),
    builder: (context, controller) => FlashBar(
      controller: controller,
      icon: const Icon(Icons.info_outline_rounded),
      position: FlashPosition.top,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
      ),
      iconColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 74, 139, 75),
    ),
    context: context,
  );
}

Future<void> showError(String message, BuildContext context) {
  return showFlash(
    duration: const Duration(seconds: 4),
    builder: (context, controller) => FlashBar(
      icon: const Icon(Icons.info_outline),
      controller: controller,
      position: FlashPosition.top,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.red,
          ),
      backgroundColor: const Color.fromARGB(255, 255, 216, 217),
    ),
    context: context,
  );
}
