import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:skyjtx_website/component/animated_circle_avatar.dart';
import 'package:skyjtx_website/component/custom_scaffold.dart';
import 'package:skyjtx_website/component/selectable_box.dart';
import 'package:skyjtx_website/provider/global_key.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeKey = 'home';

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedCircleAvatarState> animatedCircleAvatarKey = GlobalKey();
  final GlobalKey<CustomScaffoldState> customScaffoldKey = GlobalKey();
  final scrollController = ScrollController();

  Widget langRich(BuildContext context, String label, String url, ImageProvider logo) {
    return CustomWellBox(
      width: 100,
      height: 100,
      label: Text(
        label,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () async {
        try {
          await launchUrl(Uri.parse(url));
        } catch (e) {
          log(e.toString());
          if (!context.mounted) return;
          GlobalKeyProvider.of(context).showSnackBar(
            context,
            content: const Text('Failed to launch URL'),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: logo,
            width: 50,
            height: 50,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              );
            },
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              log(error.toString(), error: error, stackTrace: stackTrace);
              return const Center(
                child: Icon(Icons.error),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      key: customScaffoldKey,
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
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
                        onLongPress: () async {
                          try {
                            const url = 'https://github.com/SkyJTx/';
                            await launchUrl(Uri.parse(
                              url,
                            ));
                          } catch (e) {
                            log(e.toString());
                            if (!context.mounted) return;
                            GlobalKeyProvider.of(context).showSnackBar(
                              context,
                              content: const Text('Failed to launch URL'),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'SkyJT\'s Website',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'My name is Nattakarn Khumsupha. I\'m a computer engineering student at KMUTNB (King Mongkut\'s University of Technology North Bangkok). I\'m currently interested in Programming, Technology, Classical Music, History, and many more.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: theme.colorScheme.primaryContainer,
                      thickness: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Experienced Programming Languages and Tools:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      children: [
                        langRich(
                          context,
                          'Python',
                          'https://www.python.org/',
                          const AssetImage(
                            'assets/icons/python.png',
                          ),
                        ),
                        langRich(
                          context,
                          'Dart',
                          'https://dart.dev/',
                          const AssetImage(
                            'assets/icons/dart.png',
                          ),
                        ),
                        langRich(
                          context,
                          'Flutter',
                          'https://flutter.dev/',
                          const AssetImage(
                            'assets/icons/flutter.png',
                          ),
                        ),
                        langRich(
                          context,
                          'Arduino',
                          'https://www.arduino.cc/',
                          const AssetImage(
                            'assets/icons/arduino.png',
                          ),
                        ),
                        langRich(
                          context,
                          'Bun.js (JavaScript Runtime)',
                          'https://bun.sh/',
                          const AssetImage(
                            'assets/icons/bunjs.png',
                          ),
                        ),
                        langRich(
                          context,
                          'Next.js',
                          'https://nextjs.org/',
                          const Svg(
                            'assets/icons/nextjs.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Column(
                children: [
                  const Text(
                    'Contact Me',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    children: [
                      CustomWellBox(
                        width: 100,
                        height: 100,
                        label: const Text('Email'),
                        onTap: () async {
                          try {
                            const url = 'mailto: nattakarn.khumsupha.user1@outlook.com';
                            await launchUrl(Uri.parse(
                              url,
                            ));
                          } catch (e) {
                            log(e.toString());
                            if (!context.mounted) return;
                            GlobalKeyProvider.of(context).showSnackBar(
                              context,
                              content: const Text('Failed to launch URL'),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.email,
                          size: 50,
                        ),
                      ),
                      CustomWellBox(
                        width: 100,
                        height: 100,
                        label: const Text('GitHub'),
                        onTap: () async {
                          try {
                            const url = 'https://github.com/SkyJTx';
                            await launchUrl(Uri.parse(
                              url,
                            ));
                          } catch (e) {
                            log(e.toString());
                            if (!context.mounted) return;
                            GlobalKeyProvider.of(context).showSnackBar(
                              context,
                              content: const Text('Failed to launch URL'),
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
