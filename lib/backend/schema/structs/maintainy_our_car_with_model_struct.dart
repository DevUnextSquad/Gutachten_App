// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintainyOurCarWithModelStruct extends BaseStruct {
  MaintainyOurCarWithModelStruct({
    String? image,
    String? name,
    double? price,
  })  : _image = image,
        _name = name,
        _price = price;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static MaintainyOurCarWithModelStruct fromMap(Map<String, dynamic> data) =>
      MaintainyOurCarWithModelStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
      );

  static MaintainyOurCarWithModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? MaintainyOurCarWithModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static MaintainyOurCarWithModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MaintainyOurCarWithModelStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MaintainyOurCarWithModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaintainyOurCarWithModelStruct &&
        image == other.image &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, price]);
}

MaintainyOurCarWithModelStruct createMaintainyOurCarWithModelStruct({
  String? image,
  String? name,
  double? price,
}) =>
    MaintainyOurCarWithModelStruct(
      image: image,
      name: name,
      price: price,
    );
