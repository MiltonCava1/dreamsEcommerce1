import 'dart:html' as html;

Future<html.File?> getImagen(void Function(html.File?) callback) async {
  final html.InputElement? input =
      html.FileUploadInputElement() as html.InputElement?;
  input?.accept = 'image/*';
  input?.click();

  input?.onChange.listen((event) {
    final files = input?.files;
    if (files != null && files.isNotEmpty) {
      final file = files[0];
      final reader = html.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        callback(file);
      });
    } else {
      callback(null);
    }
  });
}
