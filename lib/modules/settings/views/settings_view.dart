import 'package:flutter/material.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/l10n/l10n.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    final settingsStorage = getIt.get<SettingsStorage>();
    final isDarkMode = settingsStorage.isDarkMode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settings,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SwitchListTile(
                value: isDarkMode,
                title: Text(context.l10n.dark_mode),
                onChanged: (value) {
                  setState(() {
                    settingsStorage.setMode(isDark: value);
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                title: Text(context.l10n.language),
                trailing: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment<String>(
                      value: 'en',
                      label: Text('English'),
                    ),
                    ButtonSegment<String>(
                      value: 'ar',
                      label: Text('اللغة العربية'),
                    ),
                  ],
                  selected: {currentLocale.languageCode},
                  onSelectionChanged: (value) async {
                    final newLocale = Locale(value.first);
                    if (currentLocale == newLocale) {
                      return;
                    }
                    await AppLocalizations.delegate.load(newLocale);
                    getIt.get<SettingsStorage>().setLocale(
                          languageCode: newLocale.languageCode,
                          countryCode: newLocale.countryCode,
                        );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
