// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:shift_planner/gen/gen.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();
    Future<void>.delayed(const Duration(seconds: 1)).then((value) {
      ref.read(splashProvider.bloc).onCheckForUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final headlineLarge = Theme.of(context).textTheme.headlineLarge;
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              child: Text(
                LocaleKeys.splash_appName.tr(),
                textAlign: TextAlign.center,
                style: headlineLarge?.copyWith(
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              child: Column(
                children: [
                  Text(LocaleKeys.splash_by.tr()),
                  16.verticalSpace,
                  Assets.images.splash.image(width: 100.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
