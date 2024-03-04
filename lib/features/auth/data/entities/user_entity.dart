import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject  {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? token;

  @HiveField(2)
  String? role;

  @HiveField(3)
  String? name;

  @HiveField(4)
  String? phone;

  @HiveField(5)
  String? imageUrl;

  UserEntity({
    this.id,
    this.token,
    this.role,
    this.name,
    this.phone,
    this.imageUrl
  });

  UserEntity copyWith({
    String? id,
    String? token,
    String? role,
    String? name,
    String? phone,
    String? imageUrl,
  }) {
    return UserEntity(
      id: id ?? this.id,
      token: token ?? this.token,
      role: role ?? this.role,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }


}