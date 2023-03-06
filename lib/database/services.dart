import 'package:todo_app/database/repository.dart';
import 'package:todo_app/models/model.dart';

class UserServices {
  late Repository _repository;
  UserServices() {
    _repository = Repository();
  }

  saveUser(Task user) async {
    return await _repository.insertData("users", user.userMap());
  }

  readAllUsers() async {
    return await _repository.readData('users');
  }
}
