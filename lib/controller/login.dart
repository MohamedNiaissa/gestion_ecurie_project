import 'package:gestion_ecurie/services/login_service.dart';

// Si la longueur du tableau reourné par getUserFromCredential est > 0 alors l'utilistateur existe
Future<bool> loginUser(String username, String mdp) async {
  try {
    var userInfos = await getUserFromCredential(username, mdp);
    return true;
  } catch (e) {
    return false;
  }
}
