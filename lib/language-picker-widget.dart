import 'package:flutter/material.dart';
import 'package:multi_lang/l10n/l10n.dart';
import 'package:multi_lang/providers/local-provider.dart';
import 'package:provider/provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalProvider>(
      context,
    );
    final locale = provider.locale;
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(
          width: 12,
        ),
        items: L10n.all.map((locale) {
          final flag = L10n.getFlag(locale.languageCode);
          return DropdownMenuItem(
            child: Center(
              child: Text(
                flag,
                style: TextStyle(fontSize: 32),
              ),
            ),
            value: locale,
            onTap: () {
              final provider =
                  Provider.of<LocalProvider>(context, listen: false);
              provider.setLocale(locale);
            },
          );
        }).toList(),
        onChanged: (val) {},
      ),
    );
  }
}
