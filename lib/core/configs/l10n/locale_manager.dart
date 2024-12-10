import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/sources/local/local_storage.dart';
import 'locale_manager_bloc.dart';
import 'locale_manager_event.dart';
import 'locale_manager_state.dart';
class LanguageOption {
  final Locale locale;
  final String displayName;
  final String flagIcon;

  LanguageOption({
    required this.locale,
    required this.displayName,
    required this.flagIcon,
  });
}

class LanguageManager extends StatelessWidget {
  final LocalStorage localStorage;

  const LanguageManager({required this.localStorage});

  List<LanguageOption> getLanguageOptions() {
    return [
      LanguageOption(
        locale: const Locale('en'),
        displayName: 'English',
        flagIcon: '🇺🇸',
      ),
      LanguageOption(
        locale: const Locale('vi'),
        displayName: 'Tiếng Việt',
        flagIcon: '🇻🇳',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(localStorage),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return Column(
            children: getLanguageOptions().map((option) {
              return ListTile(
                title: Text(option.displayName),
                leading: Text(option.flagIcon),
                onTap: () {
                  context.read<LanguageBloc>().add(ChangeLanguageEvent(option.locale));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}