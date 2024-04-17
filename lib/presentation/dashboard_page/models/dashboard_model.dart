import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'gridordertext_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class DashboardModel extends Equatable {
  DashboardModel({this.gridordertextItemList = const []});

  List<GridordertextItemModel> gridordertextItemList;

  DashboardModel copyWith(
      {List<GridordertextItemModel>? gridordertextItemList}) {
    return DashboardModel(
      gridordertextItemList:
          gridordertextItemList ?? this.gridordertextItemList,
    );
  }

  @override
  List<Object?> get props => [gridordertextItemList];
}
