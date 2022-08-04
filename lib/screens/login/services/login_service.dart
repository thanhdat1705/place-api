import 'package:flutter/cupertino.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/requests/auth_request/auth_request.dart';
import 'package:project_places_api_mobile/shared/services/auth_social_firebase.dart';
import 'package:project_places_api_mobile/shared/services/push_notification_manager.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';

Future<bool> onLoginToServer(int provider, BuildContext context) async {
  //Account account = null;
  var accessTokenSocial;
  ResponseServer responseServer;
  if (provider == 0) {
    accessTokenSocial = await signInWithFacebook();

    // signInWithFacebook().then((value) {
    //   authUser(new AuthRequest(accessToken: value, provider: provider)).then(
    //       (response) {
    //     //account = response.data;
    //     print('token Login Facebook: ' + response.data.token);
    //     addHeader('Authorization', 'Bearer ' + response.data.token);
    //     GeneralHelper.saveToSharedPreferences("token", response.data.token);
    //     initProfileScreen(context);
    //   }, onError: (error) {
    //     print(error);
    //   });
    // });
  } else {
    accessTokenSocial = await signInWithGoogle();
    // signInWithGoogle().then((value) {
    //   authUser(new AuthRequest(accessToken: value, provider: provider))
    //       .then((response) {
    //     //account = response.data;
    //     print('token Login Google: ' + response.data.token);
    //     addHeader('Authorization', 'Bearer ' + response.data.token);
    //     GeneralHelper.saveToSharedPreferences("token", response.data.token);
    //     initProfileScreen(context);
    //   });
    // });
  }

  responseServer = await authUser(
      context,
      new AuthRequest(
          accessToken: accessTokenSocial,
          provider: provider,
          firebaseMessagingToken:
              PushNotificationsManager.firebaseMessageToken));

  if (responseServer.statusCode != 400) {
    Account account = responseServer.data;
    await PushNotificationsManager.show(
        title: "Welcome " + account.displayName,
        body: "Hello from Places Information's team",
        payload: 'item x');
    print('token Login Social: ' + account.token);
    addHeader('Authorization', 'Bearer ' + account.token);
    ResponseServer responseListString = await getFollowingStoreAPI(context);
    MemoryStorage.set("FollowingStore", responseListString.data);
    MemoryStorage.set('AccountUser', account);
    GeneralHelper.saveToSharedPreferences("token", account.token);
  }
  return true;
  //login to server
}
