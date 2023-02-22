/*
class Background {
//  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Color appColor = Colors.green;
  Chaker({required double temp}) async {
    //var prefs = SharedPreferences.getInstance();

    if (temp >= 5) {
      appColor = Colors.red;
      // cheking if the temp is less than -5 then
      // send local notfication alert the user
      // pop up alert screen
      // add the degree with the date to the badTemps shared prefs list
      // color the app with red color
    } else {}
  }
//final prefs = await SharedPreferences.getInstance();
//await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
//final List<String>? items = prefs.getStringList('items');
}

/*
------- firebase web -------
firebase login

{problem with this ::
'firebase' is not recognized as an internal or external command,
operable program or batch file.}

firebase init

"site": "maher-system-1",

firebase deploy --only hosting:maher-system-1
*/

*/