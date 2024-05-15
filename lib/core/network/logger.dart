import 'dart:developer' show log;

void debugLog({required String message}) {
  log("debug logger${DateTime.now()}::  $message");
}
