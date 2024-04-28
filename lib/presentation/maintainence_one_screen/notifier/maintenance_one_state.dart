part of './maintenance_one_notifier.dart';

/// Represents the state of MaintenanceOne in the application.

// ignore_for_file: must_be_immutable
class MaintenanceOneState extends Equatable {
  MaintenanceOneState({this.maintenanceOneModelObj});

  MaintenanceOneModel? maintenanceOneModelObj;

  @override
  List<Object?> get props => [maintenanceOneModelObj];
  MaintenanceOneState copyWith({MaintenanceOneModel? maintenanceOneModelObj}) {
    return MaintenanceOneState(
      maintenanceOneModelObj:
          maintenanceOneModelObj ?? this.maintenanceOneModelObj,
    );
  }
}
