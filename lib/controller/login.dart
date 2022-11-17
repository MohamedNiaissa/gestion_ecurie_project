import 'package:gestion_ecurie/models/user.dart';
import 'package:gestion_ecurie/services/login_service.dart';

import '../backend/local_storage.dart';

verifyUser(String username, String mdp) async {
    var userInfos  = await Login.getUser(username, mdp);
    print("*******");
    print(userInfos[0]["userPhone"]);
    print("*******");

    if(userInfos.length > 0) {
     User token = new User(userInfos[0][username], userInfos[0]["userMdp"], userInfos[0]["userPhoto"], userInfos[0]["userMail"], userInfos[0]["userPhone"], userInfos[0]["profilFFE"], userInfos[0]["dateNaiss"], userInfos[0]["isGerant"]);
        // LocalStorageHelper.saveValue("token", token);
    }

}