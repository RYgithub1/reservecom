import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // static final String appEnvironment = DotEnv().env['APP_ENV'];
  // static final baseUrl = DotEnv().env['BASE_URL'];
  static final baseUrl = env['BASE_URL'];
}
