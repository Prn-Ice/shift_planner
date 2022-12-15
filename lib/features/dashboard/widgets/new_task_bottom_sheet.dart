// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/app/models/models.dart';
import 'package:shift_planner/features/dashboard/widgets/widgets.dart';
import 'package:shift_planner/gen/gen.dart';
import '../cubit/new_task_cubit.dart';

class NewTaskBottomSheet extends ConsumerWidget {
  const NewTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(newTaskProvider, (prev, next) => _listener(prev, next, context));
    final status = ref.watch(newTaskProvider.select((value) => value.status));

    return LoadingIndicator(
      isLoading: status == FormzStatus.submissionInProgress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            48.verticalSpace,
            const _TitleInput(),
            16.verticalSpace,
            const _DateInput(),
            16.verticalSpace,
            const _ShiftInput(),
            48.verticalSpace,
            const _AddButton(),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _listener(NewTaskState? prev, NewTaskState next, BuildContext context) {
    if (prev == next) return;

    if (next.status == FormzStatus.submissionSuccess) {
      final snackBar = SnackBar(
        content: Text(LocaleKeys.dashboard_addTaskSuccess.tr()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (next.status == FormzStatus.submissionFailure && next.error.isNotEmpty) {
      final snackBar = SnackBar(
        content: Text(next.error),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class _TitleInput extends ConsumerWidget {
  const _TitleInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      newTaskProvider.select((value) => value.title),
    );

    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields),
        hintText: LocaleKeys.dashboard_title.tr(),
        errorText: title.errorText,
      ),
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      onChanged: (value) =>
          ref.read(newTaskProvider.bloc).onTitleChanged(value),
    );
  }
}

class _DateInput extends ConsumerWidget {
  const _DateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(
      newTaskProvider.select((value) => value.date),
    );

    return DateInput(
      errorText: date.errorText,
      onChanged: (value) =>
          ref.read(newTaskProvider.bloc).onDateChanged(value.toIso8601String()),
    );
  }
}

class _ShiftInput extends ConsumerWidget {
  const _ShiftInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shift = ref.watch(
      newTaskProvider.select((value) => value.shift),
    );

    return ShiftDropDown(
      errorText: shift.errorText,
      onChanged: (value) =>
          ref.read(newTaskProvider.bloc).onShiftChanged(value?.name ?? ''),
    );
  }
}

class _AddButton extends ConsumerWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(newTaskProvider.select((value) => value.status));

    return ElevatedButton(
      onPressed: status == FormzStatus.valid
          ? ref.read(newTaskProvider.bloc).onCreateTask
          : null,
      child: Text(LocaleKeys.dashboard_addTask.tr()),
    );
  }
}
