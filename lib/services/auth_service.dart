import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_commando/constants/constant.dart';
import 'package:smart_commando/models/isnewuser_data_model.dart';
import 'package:smart_commando/models/user.dart';

class AuthService {
  final liverurl = '$generalUrl/';
  // final liverurl = 'http://10.0.2.2:3000/';
  // final liverurl = 'https://brainworld-api.cyclic.app/';
  postData(data, apiUrl) async {
    print('dataup' + data.toString());

    var fullUrl = liverurl + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeader(),
    );
  }

  Future register(fullname, email, password) async {
    var data = {
      'full_name': fullname,
      'email': email,
      'password': password,
    };
    var response = await AuthService().postData(data, 'register');
    return setUserToStorage(response, true);
  }

  Future login(email, password) async {
    var data = {
      'email': email,
      'password': password,
    };
    var response = await AuthService().postData(data, 'login');

    return setUserToStorage(response, true);
  }

  logout() async {
    var response = {"success": true, "message": "success achived"};
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    // MyNavigate.navigatepushuntil(Login(), context);

    return response;
  }

  updateUser({required Map<String, String> dataToupdate}) async {
    var response = await AuthService().postData(dataToupdate, 'updateUser');
    print('dataToupdate body');

    print(response.body);
    return setUserToStorage(response, false);
  }

  Future updateProfilePicture(File profilePic) async {
    // MyNavigate.navigatepushuntil(Login(), context);
    var user = await AuthService().getuserFromStorage();
    var request = http.MultipartRequest(
        'POST', Uri.parse('$generalUrl/updateProfilePicture'));
    var filemultipart = await http.MultipartFile.fromPath(
      'image',
      profilePic.path,
    );
    request.headers['x-access-token'] = user.token!;
    request.files.add(filemultipart);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.body);
    return response;
  }

  Future<User> getAUser(userId) async {
    var user = await AuthService().getuserFromStorage();
    var data = {'token': user.token, 'user_id': userId};
    var response = await AuthService().postData(data, 'getAUser');
    //var datar=jsonDecode(response);
    var responseData = json.decode(response.body);
    var postMap = responseData['_id'];
    var userFromNetWork = User.fromJson(responseData['user']);
    // postsController.allPost.add(books.fromJson(data));
    return userFromNetWork;
  }

  isNewUser({user, IsNewUserModel? userModel}) {
    return userModel != null
        ? userModel.toJson()
        : IsNewUserModel(
                id: user['_id'],
                username: user['full_name'],
                newlyRegistered: true,
                regAt: 'regAt')
            .toJson();
  }

  static void setIsNewUser(userModel) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('isNewUserData',
        json.encode(AuthService().isNewUser(userModel: userModel)));
  }

  setUserToStorage(response, bool newUser) async {
    var body = json.decode(response.body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(body['user']));
      if (newUser == true) {
        localStorage.setString(
            'isNewUserData', json.encode(isNewUser(user: body['user'])));
      }
      return {
        "success": true,
        "message": body['message'],
        "user": body['user']
        // "isNewUserJson":
      };
    } else {
      return {"success": false, "message": body['message']};
    }
  }

  Future<IsNewUserModel> getIsNewuserFromStorage() async {
    //provider will use this one
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var userString = localStorage.getString('isNewUserData');
    // print(userJson);
    var userJson = json.decode(userString!);
    // print(user['_id']);
    // User user = json.decode(userJson!);
    IsNewUserModel userData = IsNewUserModel.fromJson(userJson);
    return userData;
  }

  Future<User> getuserFromStorage() async {
    //provider will use this one
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var userString = localStorage.getString('user');
    // print(userJson);
    var userJson = json.decode(userString!);
    // print(user['_id']);
    // User user = json.decode(userJson!);
    User user = User.fromJson(userJson);
    return user;
  }

  _setHeader() => <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8',
        // 'Accept': 'application/json'
        // 'x-access-token': token
      };
}
