import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/helpers/inject.dart';
import 'package:mobx_example/pages/counter.dart';
import 'package:mobx_example/pages/no_internet.dart';
import 'package:mobx_example/stores/connectivity/connectivity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return _Unfocus(child: _InitialWidget());
      },
    );
  }
}

class _InitialWidget extends StatelessWidget {
  _InitialWidget();

  final ConnectivityStore store = GetIt.I.get<ConnectivityStore>();

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return reaction((result) => store.connectivityStream.value, (result) {
          final messenger = ScaffoldMessenger.of(context);
          messenger.showSnackBar(SnackBar(
              content: Text(result == ConnectivityResult.none
                  ? 'You\'re offline'
                  : 'You\'re online')));
        }, delay: 0);
      },
      child: StreamBuilder<ConnectivityResult>(
        stream: store.connectivityStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (isNetworkAvailable(snapshot)) {
              return CounterPage();
            } else {
              return const NoInternetPage();
            }
          } else {
            return const NoInternetPage();
          }
        },
      ),
    );
  }

  bool isNetworkAvailable(AsyncSnapshot<ConnectivityResult> snapshot) {
    return snapshot.data == ConnectivityResult.mobile ||
        snapshot.data == ConnectivityResult.wifi;
    // || snapshot.data == ConnectivityResult.vpn ||
    // snapshot.data == ConnectivityResult.ethernet;
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.
class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
