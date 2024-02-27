import 'package:onyx_test/app/helpers/api.dart';
import 'package:onyx_test/app/helpers/end_points.dart';
import 'package:onyx_test/app/helpers/keys.dart';
import 'package:onyx_test/app/helpers/prefs.dart';

class LoginService {
  Future<void> login({
    required String id,
    required String password,
  }) async {
    final res = await Api.post(
      EndPoints.login,
      body: {
        "Value": {
          "P_LANG_NO": "2",
          "P_DLVRY_NO": id,
          "P_PSSWRD": password,
        },
      },
    );

    if (res.statusCode != 200) {
      throw res.data['Result']['ErrMsg'].toString() + res.data;
    }

    Prefs.setString(PrefsKeys.userName, res.data['Data']['DeliveryName']);
    Prefs.setString(
      PrefsKeys.userId,
      id,
    );
  }
}
