import 'package:flutter/src/foundation/key.dart';
import 'package:stacked/stacked.dart';

import 'core_view_model.dart';

abstract class CoreScreen<T extends CoreViewModel> extends ViewModelBuilderWidget<T> {
  const CoreScreen({Key? key}) : super(key: key);

}