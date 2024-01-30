import 'package:http/http.dart' as http;
import 'package:state_with_bloc/models/item_model.dart';

class ItemRepository {
  Future<List<ItemModel>> getItems() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = itemModelFromJson(response.body);
      return data;
    } else {
      throw Exception("Failed No Data get");
    }
  }
}
