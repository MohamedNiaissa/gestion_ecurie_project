import 'package:universal_html/html.dart';

class LocalStorageHelper {
  static Storage localStorage = window.localStorage;

  // Enregistrer une clé valeur dans le localstorage
  static void saveValue(String key, String value){
    localStorage[key] = value;
  }

  // Récupérer la clé et la valeur associé à partir de la clé dans le localstorage
  static getValue(String key) {
    return localStorage[key];
  }

  // Supprime la clé et la valeur associé à partir de la clé dans le localStorage
  static void removeValue(String key) {
    localStorage.remove(key);
  }

  // Supprime tous les éléments du localStorage
  static void clearAll() {
    localStorage.clear();
  }
}