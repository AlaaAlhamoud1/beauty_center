import 'package:flutter/material.dart';

const String root = '/';

class NavigatorWidget extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget widget;

  const NavigatorWidget({super.key, this.navigatorKey, required this.widget});

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {root: (context) => widget};
  }
}
