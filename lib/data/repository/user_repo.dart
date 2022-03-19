import 'package:food_ui/data/api/api_client.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:get/get.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  
  Future<Response>getUserInfo()async{
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}