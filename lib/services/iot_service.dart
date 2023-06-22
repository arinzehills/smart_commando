import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_commando/services/auth_service.dart';

class IotService {
  Future addWifi(wifi_name, password) async {
    var data = {
      'email': wifi_name,
      'password': password,
    };
    var response = await AuthService().postData(data, 'addWifi');
    var body = json.decode(response.body);

    return body;
  }

  Future sprayGas(actionpin, turnOn) async {
    print('hitted');
    var data = {
      'rstp_url': actionpin,
      // 'token': token,
      'sprayedOn': DateTime.now().toString()
    };

    var response = await IotService().postData(turnOn);
    var body = json.decode(response.body);
    print(body);
    var res = await IotService().addAction(data);
    return res;
  }

  Future addAction(param) async {
    var data = param;
    var response = await AuthService().postData(data, 'addAction');
    var body = json.decode(response.body);
    // print(addAction(param));
    return body;
  }

  postData(rotate) async {
    var fullUrl = rotate == true
        ? 'http://192.168.43.222/turnservooff'
        : "http://192.168.43.222/turnservo";
    return await http.get(
      Uri.parse(fullUrl),
      // body: jsonEncode(data),
      // headers: _setHeader(),
    );
  }

  _setHeader() => <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8',
        // 'Accept': 'application/json'
        // 'x-access-token': token
      };
}
