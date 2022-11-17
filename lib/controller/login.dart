import 'package:gestion_ecurie/services/login_service.dart';

import '../backend/local_storage.dart';

// Si la longueur du tableau retourné par getUserFromCredential est > 0 alors l'utilistateur existe
Future<bool> loginUser(String username, String mdp) async {
  try {
    await getUserFromCredential(username, mdp).then((userI) => {
          LocalStorageHelper.saveValue("tokenUser", userI.toString()),
        });
    return true;
  } catch (e) {
    return false;
  }
}
