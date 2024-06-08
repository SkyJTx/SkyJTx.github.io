import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:skyjtx_website/component/animated_circle_avatar.dart';
import 'package:skyjtx_website/component/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedCircleAvatarState> animatedCircleAvatarKey =
      GlobalKey<AnimatedCircleAvatarState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  kToolbarHeight,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100.h -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom -
                      kToolbarHeight,
                  width: 100.w,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedCircleAvatar(
                          key: animatedCircleAvatarKey,
                          backgroundColor: Colors.transparent,
                          radius: 100,
                          backgroundImage: const AssetImage('assets/icons/logo.jpg'),
                          child: InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            overlayColor: WidgetStateProperty.all(Colors.transparent),
                            customBorder: const CircleBorder(),
                            onTap: () {
                              animatedCircleAvatarKey.currentState?.controller.forward(from: 0);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SelectableText(
                          'SkyJT\'s Website',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SelectableText(
                          'Software Developer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  margin: const EdgeInsets.all(32),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      SelectableText(
                        'About Me',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      SelectableText(
                        'My name is Nattakarn Khumsupha. I\'m a computer engineering student at KMUTNB (King Mongkut\'s University of Technology North Bangkok). I\'m currently interested in Programming, Technology, Classical Music, History, and many more.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
