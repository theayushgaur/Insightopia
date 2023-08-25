import 'package:flutter/material.dart';

class FavouriteItem extends ChangeNotifier {
  final List<String> _selectedItem = [];
  final List<String> _title = [];
  final List<String> _desc = [];
  final List<String> _img = [];

  List<String> get selectedItem => _selectedItem;
  List<String> get title => _title;
  List<String> get desc => _desc;
  List<String> get img => _img;
  void toggleFav(String title, desc, url, img) {
    final isExist = _selectedItem.contains(url);
    final isExistdesc = _title.contains(title);
    final isExisturl = desc.contains(desc);
    final isExistimg = img.contains(img);

    if (isExist && isExistdesc && isExisturl && isExistimg) {
      _title.remove(title);
      _desc.remove(desc);
      _selectedItem.remove(url);
      _img.remove(img);
    } else {
      _title.add(title);
      _desc.add(desc);
      _selectedItem.add(url);
      _img.add(img);
    }
    notifyListeners();
  }

  bool isExistItem(String title, desc, url, img) {
    final isExist = _selectedItem.contains(url) &&
        _title.contains(title) &&
        _desc.contains(desc) &&
        _img.contains(img);

    return isExist;
  }
}
