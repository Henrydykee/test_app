

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/enum/status.dart';
import 'package:test_app/model/model.dart';
import 'package:test_app/services/user_services.dart';

class UserViewModel extends ChangeNotifier {
  Status _status;
  String _errorMessage;
//  User _user;
  var _api = API();
  var _user;

  List<User> getUser() => _user;




  Status getStatus() {
    return _status;
  }

  // ignore: missing_return
  Future<void> getListedUsers() {
    _status = Status.LOADING;
    notifyListeners();
    try{
      _api.getUsers().then((response){
        if(response.statusCode == 200 && response.statusCode <300){
          List<User> user = UserList.fromJson(json.decode(response.body)).user;
          _user = user;
          log("${response.body}");
          _status = Status.SUCCESSFUL;
          notifyListeners();
        }
      });
    }catch(e){
      log("${e}");
      _status = Status.FAILED;
      notifyListeners();
    }
  }
}