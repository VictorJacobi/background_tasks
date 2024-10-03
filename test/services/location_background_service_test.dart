import 'package:flutter_test/flutter_test.dart';
import 'package:background_location/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocationBackgroundServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

