import 'package:get/get.dart';
import 'package:salon_app/app/translations/en_hindi/en_hindi.dart';

abstract class AppTranslation extends Translations {
  static Map<String, Map<String, String>> translations = {
    'hi_IN': en_hindi,
//     'en_US' : enUs,
//     'es_mx' : esMx
// };
  };
}
