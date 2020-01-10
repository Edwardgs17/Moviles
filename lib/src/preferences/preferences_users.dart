import 'package:shared_preferences/shared_preferences.dart';


class PreferencesUsers {

  static final PreferencesUsers _instances = new PreferencesUsers._internal();

  factory PreferencesUsers() {
    return _instances;
  }

  PreferencesUsers._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token ( String value ) {
    _prefs.setString('token', value);
  }
  

  // GET and SET last page
  get lastPage {
    return _prefs.getString('lastPage') ?? 'login';
  }

  set lastPage( String value ) {
    _prefs.setString('lastPage', value);
  }

}
