import 'package:background_location/services/fl_location_service.dart';
import 'package:background_location/services/location_background_service.dart';
import 'package:background_location/ui/bottom_sheets/basic/basic_sheet.dart';
import 'package:background_location/ui/dialogs/basic/basic_dialog.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [],
  dependencies: [
    LazySingleton(classType: FlLocationService),
    LazySingleton(classType: LocationBackgroundService),
  ],
  bottomsheets: [
    // StackedBottomsheet(classType: BasicSheet),
    StackedBottomsheet(classType: BasicSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    // StackedDialog(classType: BasicDialog),
    StackedDialog(classType: BasicDialog),
// @stacked-dialog
  ],
)
class App {}
