// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/app/models/models.dart';
import 'package:shift_planner/features/dashboard/widgets/widgets.dart';
import 'package:shift_planner/gen/gen.dart';
import '../cubit/edit_task_cubit.dart';

class EditTaskBottomSheet extends ConsumerStatefulWidget {
  const EditTaskBottomSheet({super.key, required this.task});

  final NurseTask task;

  @override
  ConsumerState<EditTaskBottomSheet> createState() =>
      _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends ConsumerState<EditTaskBottomSheet> {
  @override
  void initState() {
    super.initState();

    ref.read(editTaskProvider.bloc).onOldTaskChanged(widget.task);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      editTaskProvider,
      (prev, next) => _listener(prev, next, context),
    );
    final status = ref.watch(editTaskProvider.select((value) => value.status));

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
            const _TimeInput(),
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

  void _listener(
    EditTaskState? prev,
    EditTaskState next,
    BuildContext context,
  ) {
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
      editTaskProvider.select((value) => value.title),
    );

    return TextFormField(
      key: ValueKey(title),
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields),
        hintText: LocaleKeys.dashboard_title.tr(),
        errorText: title.errorText,
      ),
      initialValue: title.value,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      onChanged: (value) =>
          ref.read(editTaskProvider.bloc).onTitleChanged(value),
    );
  }
}

class _DateInput extends ConsumerWidget {
  const _DateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(
      editTaskProvider.select((value) => value.date),
    );

    return DateInput(
      key: ValueKey(date),
      errorText: date.errorText,
      initial: DateTime.tryParse(date.value),
      // ignore: prefer-extracting-callbacks
      onChanged: (value) {
        ref.read(editTaskProvider.bloc).onDateChanged(value.toIso8601String());
        FocusScope.of(context).nextFocus();
      },
    );
  }
}

class _TimeInput extends ConsumerWidget {
  const _TimeInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(
      editTaskProvider.select((value) => value.time),
    );

    return TimeInput(
      key: ValueKey(time),
      errorText: time.errorText,
      initial: TimeOfDay.fromDateTime(
        DateTime.tryParse(time.value) ?? DateTime.now(),
      ),
      // ignore: prefer-extracting-callbacks
      onChanged: (value) {
        ref.read(editTaskProvider.bloc).onTimeChanged(value.toIso8601String);
      },
    );
  }
}

class _ShiftInput extends ConsumerWidget {
  const _ShiftInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shift = ref.watch(
      editTaskProvider.select((value) => value.shift),
    );

    return ShiftInput(
      value: shift,
    );
  }
}

class _AddButton extends ConsumerWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(editTaskProvider.select((value) => value.status));

    return ElevatedButton(
      onPressed: status == FormzStatus.valid
          ? ref.read(editTaskProvider.bloc).onUpdateTask
          : null,
      child: Text(LocaleKeys.dashboard_save.tr()),
    );
  }
}
