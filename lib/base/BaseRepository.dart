
import 'package:mental_health/data/api/ApiHitter.dart';

class BaseRepository {
  final apiHitter = ApiHitter();
  final dio = ApiHitter.getDio();
}