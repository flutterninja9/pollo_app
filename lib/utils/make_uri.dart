makeUri(String path, {Map<String, dynamic>? queryParameters}) {
  Uri uri = Uri.parse('https://polloeducation.tunajifoundation.com');

  final finalUri = uri.replace(queryParameters: queryParameters, path: path);
  return finalUri;
}
