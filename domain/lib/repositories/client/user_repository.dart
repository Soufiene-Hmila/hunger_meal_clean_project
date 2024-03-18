
import 'package:core/core.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/entities/client/profile_data.dart';
import 'package:domain/entities/client/verification_data.dart';
import 'package:domain/entities/client/zone_address_data.dart';

abstract class UserRepository {

  Future<DataState<LoginData?>> setPhoneAction(PhoneParams? params);

  Future<DataState<VerificationData?>> setVerificationAction(VerificationParams? params);
  Future<DataState<LoginData?>> setResetVerificationAction(PhoneParams? params);

  Future<DataState<dynamic>> setInfoAction(InfoParams? params);

  Future<DataState<ProfileData?>> getProfileAction(int? params);

  Future<DataState<List<ZoneAddressData>?>> getZonesAction();

}
