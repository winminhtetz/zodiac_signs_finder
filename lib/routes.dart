import 'package:shelf_router/shelf_router.dart';
import 'package:zodiac_signs_finder/handler.dart';

final router = Router()..post('/get_my_zodiac', getNatalData);
