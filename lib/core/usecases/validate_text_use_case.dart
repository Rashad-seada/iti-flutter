
class ValidateTextUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter the data";
    } else if(int.tryParse(text) == null) {
      return "Please enter number only";
    } else {
      return null;
    }
  }

}