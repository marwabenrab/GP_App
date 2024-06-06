import 'package:fikra_app/language/ar.dart';
import 'package:fikra_app/language/en.dart';
import 'package:fikra_app/language/fr.dart';
import 'package:get/get.dart';

class Translation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en' :en,
    'ar' :ar,
    'fr' :fr,
  };
  
}