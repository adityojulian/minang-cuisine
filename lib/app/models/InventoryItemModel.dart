class InventoryItemModel {
  bool? recycle;
  String? material;
  dynamic? weight;
  String? id;
  String? name;
  String? type;
  String? bought_id;

  InventoryItemModel(
      {this.recycle,
      this.material,
      this.weight,
      this.id,
      this.name,
      this.type,
      this.bought_id});

  InventoryItemModel.fromJson(Map<String, dynamic> json) {
    recycle = json['recycle'];
    material = json['material'];
    weight = json['weight'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    bought_id = json['bought_id'];
  }

  InventoryItemModel.fromJsonItemDesc(Map<String, dynamic> json) {
    recycle = json['recycle'];
    material = json['material'];
    weight = json['weight'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  InventoryItemModel.fromJsonNotFound(String id) {
    name = "Not Found";
    id = id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recycle'] = this.recycle;
    data['material'] = this.material;
    data['weight'] = this.weight;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['bought_id'] = this.bought_id;
    return data;
  }
}
