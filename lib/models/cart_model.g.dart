// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      id: fields[0] as int,
      brand: fields[7] as String,
      title: fields[1] as String,
      price: fields[3] as int,
      discountPercentage: fields[4] as double,
      description: fields[2] as String,
      rating: fields[5] as double,
      stock: fields[6] as int,
      images: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discountPercentage)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.stock)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
