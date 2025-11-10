import 'package:flutter_riverpod/flutter_riverpod.dart';

// A simple StateProvider to hold an integer counter value.
final counterProvider = StateProvider<int>((ref) => 0);
