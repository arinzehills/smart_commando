import 'dart:convert';

import 'package:smart_commando/models/camera_model.dart';
import 'package:smart_commando/services/auth_service.dart';

class CameraService {
  Future addCamera(rstp_url) async {
    var data = {
      'rstp_url': rstp_url,
      // 'token': token,
    };
    var response = await AuthService().postData(data, 'addCamera');
    var body = json.decode(response.body);

    return body;
  }

  Future<List<Camera>> getAllCameras() async {
    var user = await AuthService().getuserFromStorage();
    var data = {
      'token': user.token,
    };
    var response = await AuthService().postData(data, 'getAllCameras');
    //var datar=jsonDecode(response);
    var responseData = json.decode(response.body);

    var postMap = responseData['cameras'];
    print('responseData');
    print(postMap);
    List<Camera> cameras = [];
    for (var data in postMap) {
      cameras.add(Camera.fromJson(data));
      // postsController.allPost.add(Camera.fromJson(data));
    }
    print('cameras');
    print(cameras);

    return cameras;
  }
}
