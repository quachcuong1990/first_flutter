import 'package:json_annotation/json_annotation.dart';
import 'package:tyest/model/base_model.dart';

part 'link_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LinkModel extends BaseModel {
  @JsonKey(defaultValue: '')
  String Linkhome;

  @JsonKey(defaultValue: '')
  String Linkhelp;

  @JsonKey(defaultValue: '')
  String Linkpolicy;

  @JsonKey(defaultValue: '')
  String Linkzalo;

  @JsonKey(defaultValue: '')
  String Linkemail;

  LinkModel(
      {
      this.Linkhome = '',
      this.Linkhelp = '',
      this.Linkpolicy = '',
      this.Linkzalo = '',
      this.Linkemail = ''});

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}
