import 'dart:convert';

extension StringEncoder on String {
  List<int> get bytes {
    return utf8.encode(this);
  }
}
