// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/gen/gen.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerProvider, (prev, next) {
      if (prev == next) return;

      if (next.status == FormzStatus.submissionFailure &&
          next.error.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(next.error),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    final status = ref.watch(registerProvider.select((value) => value.status));

    return LoadingIndicator(
      isLoading: status == FormzStatus.submissionInProgress,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(LocaleKeys.register_welcome.tr()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _EmailInput(),
                16.verticalSpace,
                const _PasswordInput(),
                92.verticalSpace,
                const _RegisterButton(),
                24.verticalSpace,
                OutlinedButton(
                  onPressed: () => context.replaceRoute(const LoginRoute()),
                  child: Text(LocaleKeys.register_loginInstead.tr()),
                ),
                128.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends ConsumerWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(registerProvider.select((value) => value.status));

    return ElevatedButton(
      onPressed: status == FormzStatus.valid
          ? ref.read(registerProvider.bloc).onRegister
          : null,
      child: Text(LocaleKeys.register_register.tr()),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(
      registerProvider.select((value) => value.password),
    );

    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: const Icon(Icons.password),
        hintText: LocaleKeys.password.tr(),
        errorText: password.errorText,
      ),
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          ref.read(registerProvider.bloc).onPasswordChanged(value),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(
      registerProvider.select((value) => value.email),
    );

    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        hintText: LocaleKeys.email.tr(),
        errorText: email.errorText,
      ),
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) =>
          ref.read(registerProvider.bloc).onEmailChanged(value),
    );
  }
}
