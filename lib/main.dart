import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_lang/language-picker-widget.dart';
import 'package:multi_lang/language-widget.dart';
import 'package:multi_lang/providers/local-provider.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocalProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocalProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            supportedLocales: L10n.all,
            locale: provider.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: Home(),
          );
        });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [LanguagePickerWidget()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LanguageWidget(),
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            AppLocalizations.of(context)!.hello('Jhon'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
