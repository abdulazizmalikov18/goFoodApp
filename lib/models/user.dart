class Foydalanuvchi {
  final String? uid;
  Foydalanuvchi({this.uid});
}

class ErrorFoydalanuvchi extends Foydalanuvchi {
  a() {
    return Foydalanuvchi();
  }
}

class FoydalanuvchiData {
  final String? uid;
  final String? ism;
  final List? buyurtma;
  final String? name;
  final List? like;
  final int? buyurtmaSoni;
  final String? number;
  final String? izoh;
  final String? id;
  final String? image;

  FoydalanuvchiData({this.uid,this.ism, this.like, this.name, this.buyurtma, this.buyurtmaSoni,this.number, this.izoh, this.id, this.image});
}
