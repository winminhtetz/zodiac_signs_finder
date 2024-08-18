import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:shelf/shelf.dart';
import 'package:zodiac_signs_finder/helpers/zodiac_helper.dart';
import 'package:zodiac_signs_finder/models/response.dart' as res;

final d.Dio dio = d.Dio();
final url = Platform.environment['BASE_URL'];

Future<Response> getNatalData(Request request) async {
  final body = await request.readAsString();
  res.Response responseData = res.Response(
    message: '',
    statusCode: -1,
    data: '',
  );

  final map = json.decode(body);
  map['page'] = 'natal';
  map['recalc'] = '';
  map['command'] = 'new';
  map['userid'] = '291056627';

  final formData = d.FormData.fromMap(map);

  final baseUrl = url ?? '';
  final response = await dio.post(baseUrl, data: formData);
  final helper = ZodiacHelper(response.data);

  try {
    final data = helper.parseZodiacData();
    responseData = responseData.copyWith(
      message: 'Birth Chart calculated successfully!',
      statusCode: 200,
      data: data,
    );
  } catch (e) {
    responseData = responseData.copyWith(
      message: 'Something went wrong!',
      statusCode: 404,
      data: [],
    );
  }

  final data = json.encode(responseData);

  if (responseData.statusCode == 200) {
    return Response.ok(
      data,
      headers: {'Content-Type': 'application/json'},
    );
  } else {
    return Response.notFound(data);
  }
}
