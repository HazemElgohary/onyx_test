import 'package:onyx_test/app/service/session_manager/session_config.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class SessionTimeoutManager extends StatefulWidget {
  final SessionConfig _sessionConfig;
  final Widget child;

  const SessionTimeoutManager({
    Key? key,
    required sessionConfig,
    required this.child,
  })  : _sessionConfig = sessionConfig,
        super(key: key);

  @override
  SessionTimeoutManagerState createState() => SessionTimeoutManagerState();
}

class SessionTimeoutManagerState extends State<SessionTimeoutManager> with WidgetsBindingObserver {
  Timer? _appLostFocusTimer;
  Timer? _userInactivityTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      if (widget._sessionConfig.invalidateSessionForAppLostFocus != null) {
        _appLostFocusTimer ??= _setTimeout(
          () => widget._sessionConfig.pushAppFocusTimeout(),
          duration: widget._sessionConfig.invalidateSessionForAppLostFocus!,
        );
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_appLostFocusTimer != null) {
        _clearTimeout(_appLostFocusTimer!);
        _appLostFocusTimer = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Attach Listener only if the user wants to invalidate the session on user inactivity
    if (widget._sessionConfig.invalidateSessionForUserInactiviity != null) {
      return Listener(
        onPointerDown: (_) {
          _userInactivityTimer?.cancel();
          _userInactivityTimer = _setTimeout(
            () => widget._sessionConfig.pushUserInactivityTimeout(),
            duration: widget._sessionConfig.invalidateSessionForUserInactiviity!,
          );
        },
        child: widget.child,
      );
    }
    // Return the original child if the condition is not met
    return widget.child;
  }

  Timer _setTimeout(callback, {required Duration duration}) {
    return Timer(duration, callback);
  }

  void _clearTimeout(Timer t) {
    t.cancel();
  }
}
