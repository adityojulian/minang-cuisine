class GroceryItems {
  String? name;
  String? type;
  String? weight;

  GroceryItems({this.name, this.type, this.weight});

  GroceryItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['weight'] = this.weight;
    return data;
  }
}
