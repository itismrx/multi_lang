import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocale => _appLocale;

  fetech() async {
    print("Fetch");
// Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    // if (prefs.getString('language_code') == '') {
    //   _appLocale = Locale('en');
    //   return;
    // }
    // _appLocale = Locale(prefs.getString('language_code')!);
    // return;

    // if()
    return;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale('en')) {
      _appLocale = Locale('en');
      await prefs.setString("language_code", 'en');
      await prefs.setString("countryCode", "US");
    } else {
      _appLocale = Locale('am');
      await prefs.setString("language_code", 'am');
      await prefs.setString("countryCode", "");
    }
    notifyListeners();
  }
}
/**
 import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_lang/providers/app-language.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';

void main() async {
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetech();

  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguage? appLanguage;
  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Multi Language',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLanguage appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            AppLocalizations.of(context)!.hello('Jhon'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(Locale("en"));
                  },
                  child: Text('English')),
              ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(Locale("am"));
                  },
                  child: Text("አማርኛ"))
            ],
          )
        ],
      ),
    );
  }
}

 */
