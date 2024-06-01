import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'utils/callbacks.dart';
import 'views/presence_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  await init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PresenceScreen(),
    );
  }
}
