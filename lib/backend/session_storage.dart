import 'package:universal_html/html.dart';

class SessionStorageHelper {
  static Storage sessionStorage = window.sessionStorage;

  // Enregistrer une clé valeur dans la sessionstorage
  static void saveValue(String key, String value){
    sessionStorage[key] = value;
  }

  // Récupérer la clé et la valeur associé à partir de la clé dans la sessionstorage
  static getValue(String key) {
    return sessionStorage[key];
  }

  // Supprime la clé et la valeur associé à partir de la clé dans la sessionstorage
  static void removeValue(String key) {
    sessionStorage.remove(key);
  }

  // Supprime tous les éléments du sessionstorage
  static void clearAll() {
    sessionStorage.clear();
  }
}
