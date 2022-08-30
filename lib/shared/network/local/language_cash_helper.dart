import 'package:cinema_app/shared/network/local/cach_helper.dart';

class LanguageCashHelper {
  static Future<bool> saveLanguageCode(String languagecode) async {
    return await CachHelper.saveData(key: 'Locale', value: languagecode);
  }

  static dynamic getLanguageCode() async {
    return await CachHelper.getData(key: 'Locale');

    // if (cashedlanguage != null) {
    //   return cashedlanguage;
    // } else {
    //   return 'en';
    // }
  }
}
