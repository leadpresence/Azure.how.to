import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/all.dart';

import 'package:azurehowto/ui/view-models/home-vm.dart';

var videosVM = ChangeNotifierProvider((_) => HomeViewModel());
