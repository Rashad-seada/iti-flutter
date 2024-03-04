

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/errors/exception.dart';
import '../../entities/user_entity.dart';

abstract class AuthLocalDataSource {

  Future<void> setUser(UserEntity user);

  Future<UserEntity> getUser();

  Future<UserEntity> updateUser(UserEntity updatedUser);

  Future<void> deleteUser();

}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  Future<Box> get box async {
    return await Hive.openBox(AppConsts.boxName);
  }

  @override
  static Future<void> initHive() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
    Hive.registerAdapter(UserEntityAdapter());
  }

  @override
  Future<void> deleteUser() async {
    try{
      await box.then((value) => value.delete(
        AppConsts.userKey,
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<UserEntity> getUser() async {
    try{
      return await box.then((value) => value.get(AppConsts.userKey,));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }


  @override
  Future<void> setUser(UserEntity user) async {
    try{
      await box.then((value) => value.put(
        AppConsts.userKey,user
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity updatedUser) async {
    try {
      // Open the user box
      final userBox = await box;

      // Retrieve the current user from the box
      UserEntity? currentUser = await userBox.get(AppConsts.userKey);

      // Check if the current user exists
      if (currentUser != null) {
        // Create an updated version of the user entity using the copyWith method
        final updatedEntity = currentUser.copyWith(
          // Update the properties of currentUser with the corresponding properties of updatedUser
          id: currentUser.id ?? updatedUser.id,
          token: currentUser.token ?? updatedUser.token,
          role: currentUser.role ?? updatedUser.role,
          name: currentUser.name ?? updatedUser.name,
          phone: currentUser.phone ?? updatedUser.phone,
          imageUrl: currentUser.imageUrl ?? updatedUser.imageUrl,
        );

        // Update the user in the box with the new entity
        await userBox.put(AppConsts.userKey, updatedEntity);

        // Return the updated user entity
        return updatedEntity;
      } else {
        // Throw an exception if the user is not found
        throw LocalDataException("User not found");
      }
    } catch (e) {
      // Throw a LocalDataException if an error occurs during the update process
      throw LocalDataException(e.toString());
    }
  }




}