import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              context: context,
              text: "Set State",
              route: "/set-state",
            ),
            _separator(),
            _button(
              context: context,
              text: "Value Notifier",
              route: "/value-notifier",
            ),
            _separator(),
            _button(
              context: context,
              text: "Change Notifier",
              route: "/change-notifier",
            ),
            _separator(),
            _button(
              context: context,
              text: "Bloc Pattern",
              route: "/bloc-pattern",
            ),
          ],
        ),
      ),
    );
  }

  Widget _button({
    required BuildContext context,
    required String text,
    required String route,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Text(text),
    );
  }

  Widget _separator() => const SizedBox(height: 16);
}
