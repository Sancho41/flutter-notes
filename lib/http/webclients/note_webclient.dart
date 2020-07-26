import 'package:dio/dio.dart';
import 'package:flutterNotes/dtos/paginated_notes.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclient.dart';

class NoteWebclient {
  static final Map<int, String> _statusCodeResponses = {
    401: 'Email or password incorrect',
    400: 'Password did not match',
    500: 'Server error',
  };

  Future<PaginatedNotesDTO> publicNotes({int page, int perPage}) async {
    Dio dio = createDio();

    try {
      Response response = await dio.get(
        '/notes/public',
        options: Options(headers: {'requirestoken': true}),
        queryParameters: {
          'perPage': perPage,
          'page': page
        }
      );
      return PaginatedNotesDTO.fromJson(response.data['data']);
    } catch (e) {
      throw HttpException(_statusCodeResponses[e.response.statusCode]);
    }
  }
}
