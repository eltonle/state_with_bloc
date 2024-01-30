import 'package:http/http.dart' as http;
import 'package:state_with_bloc/models/user_model.dart';

class UserRepository {
  Future<UserModel> getUsers() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/users"));
    if (response.statusCode == 200) {
      var data = userModelFromJson(response.body);
      return data;
    } else {
      throw Exception("Failed No Data get");
    }
  }
}
