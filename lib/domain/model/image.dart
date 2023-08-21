import 'package:event_app/common/image_utils.dart';

class Image {
  final Ratio? ratio;
  final String? url;
  final int? width;
  final int? height;
  final bool? fallback;

  Image({
    this.ratio,
    this.url,
    this.width,
    this.height,
    this.fallback,
  });
}