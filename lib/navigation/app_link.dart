import 'package:flutter/material.dart';

class AppLink {
  static const kHomePath = '/home';
  static const kOnBoardingPath = '/onboarding';
  static const kLoginPath = '/login';
  static const kProfilePath = '/profile';
  static const kItemPath = '/item';
  static const kTabParam = 'tab';
  static const kIdParam = 'id';

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

  String? location;
  int? currentTab;
  String? itemId;

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');

    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];

    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );

    return link;
  }

  String toLocation() {
    String addKeyValuePair({required String key, String? value}) =>
        value == null ? '' : '$key=$value&';

    switch (location) {
      case kLoginPath:
        return kLoginPath;
      case kOnBoardingPath:
        return kOnBoardingPath;
      case kProfilePath:
        return kProfilePath;
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValuePair(key: kIdParam, value: itemId);
        return Uri.encodeFull(loc);
      default:
        var loc = '$kHomePath?';
        loc += addKeyValuePair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}
