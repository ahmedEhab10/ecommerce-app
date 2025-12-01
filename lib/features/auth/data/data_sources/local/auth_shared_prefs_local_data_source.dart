import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefsLocalDataSource extends AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Cacheconstants.token, token);
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(Cacheconstants.token)!;
  }
}
