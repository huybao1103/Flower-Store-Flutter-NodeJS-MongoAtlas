abstract class IBaseModel<T> {
  IBaseModel();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, Object> json);
}