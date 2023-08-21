import 'package:event_app/domain/model/image.dart';
import 'package:event_app/common/image_utils.dart';

class ImageDTO {
  final Ratio? ratio;
  final String? url;
  final int? width;
  final int? height;
  final bool? fallback;

  ImageDTO({
    this.ratio,
    this.url,
    this.width,
    this.height,
    this.fallback,
  });

  factory ImageDTO.fromJson(Map<String, dynamic> json) => ImageDTO(
    ratio: ratioValues.map[json["ratio"]]!,
    url: json["url"],
    width: json["width"],
    height: json["height"],
    fallback: json["fallback"],
  );

  Map<String, dynamic> toJson() => {
    "ratio": ratioValues.reverse[ratio],
    "url": url,
    "width": width,
    "height": height,
    "fallback": fallback,
  };

  Image toImage() {
    return Image(
      ratio: ratio,
      url: url,
      width: width,
      height: height,
      fallback: fallback
    );
  }
}