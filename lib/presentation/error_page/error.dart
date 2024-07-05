import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final FlutterErrorDetails details;
  const ErrorPage({
    super.key,
    required this.details,
  });

  static const String routeKey = 'error';

  @override
  State<ErrorPage> createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  final List<Color> colors = [
    Colors.blue[800]!,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyJT\'x Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SelectionArea(
        child: AnimatedContainer(
          duration: const Duration(seconds: 5),
          decoration: BoxDecoration(
            gradient: colors.length > 1
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  )
                : null,
            color: colors.length == 1 ? colors.first : null,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RotationTransition(
                          turns: AlwaysStoppedAnimation(0 / 360),
                          child: Text(
                            ":(",
                            style: TextStyle(
                              fontSize: 100,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.details.exceptionAsString(),
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  if (kDebugMode)
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.details.stack.toString(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
