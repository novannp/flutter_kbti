// ignore_for_file: file_names

import 'package:kbti_app/configs/config.dart';

Map apiEndPoint = {
  "REGISTER": '$baseUrl/register',
  "LOGIN": '$baseUrl/login',
  "DASHBOARD": '$baseUrl/dashboard',
  "CATEGORY": '$baseUrl1/categories',
  "GET_RANDOM_DEFINITIONS": '$baseUrl1/terms/random',
  "GET_DEFINITIONS_BY_CATEGORY": '$baseUrl1/definitions?categoryId=',
  "GET_DEFINITION_BY_TERM": '$baseUrl1/definitions?term=',
  "SEARCH_DEFINITION": '$baseUrl1/search?q=',
};
