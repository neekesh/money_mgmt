part of 'get_started_page_notifier.dart';

/// Represents the state of GetStartedPage in the application.

// ignore_for_file: must_be_immutable
class GetStartedPageState extends Equatable {
  GetStartedPageState({this.getStartedPageModelObj});

  GetStartedPageModel? getStartedPageModelObj;

  @override
  List<Object?> get props => [getStartedPageModelObj];
  GetStartedPageState copyWith({GetStartedPageModel? getStartedPageModelObj}) {
    return GetStartedPageState(
      getStartedPageModelObj:
          getStartedPageModelObj ?? this.getStartedPageModelObj,
    );
  }
}
