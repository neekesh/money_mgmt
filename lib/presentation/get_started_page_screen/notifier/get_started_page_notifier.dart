import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/get_started_page_model.dart';
part 'get_started_page_state.dart';

final getStartedPageNotifier =
    StateNotifierProvider<GetStartedPageNotifier, GetStartedPageState>(
  (ref) => GetStartedPageNotifier(GetStartedPageState(
    getStartedPageModelObj: GetStartedPageModel(),
  )),
);

/// A notifier that manages the state of a GetStartedPage according to the event that is dispatched to it.
class GetStartedPageNotifier extends StateNotifier<GetStartedPageState> {
  GetStartedPageNotifier(GetStartedPageState state) : super(state);
}
