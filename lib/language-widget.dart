import 'package:flutter/material.dart';
import 'package:multi_lang/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = Localizations.localeOf(context);
    final flag = L10n.getFlag(local.languageCode);
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.black45,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(
            fontSize: 80,
          ),
        ),
      ),
    );
  }
}
