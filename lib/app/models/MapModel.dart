class MapModel {
  String? id;
  String? name;
  double? latitude;
  double? longitude;
  List<String>? materials;
  double distance = 0;

  MapModel({this.id, this.name, this.latitude, this.longitude, this.materials});

  MapModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    materials = json['materials'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['materials'] = this.materials;
    data['distance'] = this.distance;
    return data;
  }
}
