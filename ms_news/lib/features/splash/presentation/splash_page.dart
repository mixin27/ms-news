import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ms_news/shared/shared.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    _init();
    super.didChangeDependencies();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    if (mounted) context.router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).colorScheme.primary,
          size: 45,
        ),
      ),
    );
  }
}
