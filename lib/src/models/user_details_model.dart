class UsersDetailsModel {
  String? id;
  String? name;
  int? age;
  String ?city;

  UsersDetailsModel(
      { this.id,  this.name,
         this.age,  this.city,
     });

  UsersDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    city = json['city'];


  }

  UsersDetailsModel.fromSnapshot(snapshot)
      : id = snapshot.data()['id'],
      name= snapshot.data()['name'],
  age = snapshot.data()['age'],
        city = snapshot.data()['city'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['city'] = this.city;

    return data;
  }
}