import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final RouteSettings? settings;

  const NotFoundPage({
    super.key,
    this.settings,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '404 Not Found',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'The page you are looking for is not found',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
              ],
            ),
            Text(
              'PATH: ${settings?.name}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
