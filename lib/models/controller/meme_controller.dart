import 'package:state_with_bloc/locator.dart';
import 'package:state_with_bloc/repositories/orders/meme_repository.dart';

class MemeController {
  getNextMemes() {
    return locator.get<MemeRepository>().getMeme();
  }
}
