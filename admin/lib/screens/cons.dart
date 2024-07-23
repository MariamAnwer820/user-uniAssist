import 'package:admin_interface22/services/cache_services.dart';

bool is_dark = CacheService.getData(key: "is_dark") ?? false;
String? token;
