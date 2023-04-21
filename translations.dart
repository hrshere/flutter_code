import 'package:get/get.dart';
//adding custom translations
abstract class MyClass extends Translations{
  @override
  static Map<String, Map<String,String>> get translationsKeys =>{
    'en-US':{
      'hello': 'Hello World'
    },
'de-DE':{
      'hello': 'Hallo welt'
}
  };
}