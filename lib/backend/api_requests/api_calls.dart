import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Car Service Group Code

class CarServiceGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
<<<<<<< Updated upstream
      'https://carservice.templatevilla.net/api';
=======
      'https://unext-093c7f7b34c2.herokuapp.com/api'; // WICHTIG!
>>>>>>> Stashed changes
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static AuthenticateRegisteredUserApiCall authenticateRegisteredUserApiCall =
      AuthenticateRegisteredUserApiCall();
  static SignUpApiCall signUpApiCall = SignUpApiCall();
  static OTPVerificationApiCall oTPVerificationApiCall =
      OTPVerificationApiCall();
  static VerifyUserApiCall verifyUserApiCall = VerifyUserApiCall();
  static ResendOTPApiCall resendOTPApiCall = ResendOTPApiCall();
  static SignInApiCall signInApiCall = SignInApiCall();
  static ForgotPasswordApiCall forgotPasswordApiCall = ForgotPasswordApiCall();
  static ResetPasswordVerificationApiCall resetPasswordVerificationApiCall =
      ResetPasswordVerificationApiCall();
  static ResetPasswordApiCall resetPasswordApiCall = ResetPasswordApiCall();
  static DeleteUserApiCall deleteUserApiCall = DeleteUserApiCall();
  static SignOutApiCall signOutApiCall = SignOutApiCall();
  static EditProfileApiCall editProfileApiCall = EditProfileApiCall();
  static UploadImageApiCall uploadImageApiCall = UploadImageApiCall();
  static ChangePasswordApiCall changePasswordApiCall = ChangePasswordApiCall();
  static AddAddressApiCall addAddressApiCall = AddAddressApiCall();
  static SetDefaultAddressApiCall setDefaultAddressApiCall =
      SetDefaultAddressApiCall();
  static GetAddressApiCall getAddressApiCall = GetAddressApiCall();
  static IntrosApiCall introsApiCall = IntrosApiCall();
  static VehicleTypesApiCall vehicleTypesApiCall = VehicleTypesApiCall();
  static GetTimingsApiCall getTimingsApiCall = GetTimingsApiCall();
  static ServicesApiCall servicesApiCall = ServicesApiCall();
  static PackagesByServiceApiCall packagesByServiceApiCall =
      PackagesByServiceApiCall();
  static PackageDetailsApiCall packageDetailsApiCall = PackageDetailsApiCall();
  static SearchServiceApiCall searchServiceApiCall = SearchServiceApiCall();
  static BannersCall bannersCall = BannersCall();
  static BannersByServiceApiCall bannersByServiceApiCall =
      BannersByServiceApiCall();
  static AddVehicleApiCall addVehicleApiCall = AddVehicleApiCall();
  static SetDefaultVehicleApiCall setDefaultVehicleApiCall =
      SetDefaultVehicleApiCall();
  static VehicleListApiCall vehicleListApiCall = VehicleListApiCall();
  static PaymentGatewayApiCall paymentGatewayApiCall = PaymentGatewayApiCall();
  static GetCouponsApiCall getCouponsApiCall = GetCouponsApiCall();
  static ApplyCouponApiCall applyCouponApiCall = ApplyCouponApiCall();
  static StandardRateApiCall standardRateApiCall = StandardRateApiCall();
  static BookAVehicleCall bookAVehicleCall = BookAVehicleCall();
  static GetBookedDetailsApiCall getBookedDetailsApiCall =
      GetBookedDetailsApiCall();
  static OngoingOrdersApiCall ongoingOrdersApiCall = OngoingOrdersApiCall();
  static CompletedOrdersApiCall completedOrdersApiCall =
      CompletedOrdersApiCall();
  static RefundedOrderApiCall refundedOrderApiCall = RefundedOrderApiCall();
  static AddReviewApiCall addReviewApiCall = AddReviewApiCall();
  static GetReviewApiCall getReviewApiCall = GetReviewApiCall();
  static GetUserApiCall getUserApiCall = GetUserApiCall();
  static AllPackagesApiCall allPackagesApiCall = AllPackagesApiCall();
  static AvailableSlotsApiCall availableSlotsApiCall = AvailableSlotsApiCall();
  static BookAVehicleNoCouponCall bookAVehicleNoCouponCall =
      BookAVehicleNoCouponCall();
  static CancelOrderApiCall cancelOrderApiCall = CancelOrderApiCall();
  static CancelledOrdersListApiCall cancelledOrdersListApiCall =
      CancelledOrdersListApiCall();
  static CurrencyApiCall currencyApiCall = CurrencyApiCall();
  static PagesApiCall pagesApiCall = PagesApiCall();
  static EditAddressApiCall editAddressApiCall = EditAddressApiCall();
  static DeleteAddressApiCall deleteAddressApiCall = DeleteAddressApiCall();
  static EditVehicleApiCall editVehicleApiCall = EditVehicleApiCall();
  static DeleteVehicleApiCall deleteVehicleApiCall = DeleteVehicleApiCall();
}

class AuthenticateRegisteredUserApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AuthenticateRegisteredUserApi',
      apiUrl: '${baseUrl}/verify_registered_user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignUpApiCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? username = '',
    String? countryCode = '',
    String? phone = '',
    String? email = '',
    String? password = '',
    String? registrationToken = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "firstname": "${firstname}",
  "lastname": "${lastname}",
  "username": "${username}",
  "country_code": "${countryCode}",
  "phone": "${phone}",
  "email": "${email}",
  "password": "${password}",
  "registrationToken": "${registrationToken}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUpApi',
      apiUrl: '${baseUrl}/sign_up',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class OTPVerificationApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OTPVerificationApi',
      apiUrl: '${baseUrl}/otp_verification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class VerifyUserApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
    "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifyUserApi',
      apiUrl: '${baseUrl}/verify_user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResendOTPApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResendOTPApi',
      apiUrl: '${baseUrl}/resend_otp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignInApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? registrationToken = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}",
  "registrationToken": "${registrationToken}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignInApi',
      apiUrl: '${baseUrl}/sign_in',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic? userDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.userDetails''',
      );
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.id''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.firstname''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.lastname''',
      ));
  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.username''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.email''',
      ));
  String? countrycode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.country_code''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userDetails.phone''',
      ));
}

class ForgotPasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotPasswordApi',
      apiUrl: '${baseUrl}/forgot_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResetPasswordVerificationApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResetPasswordVerificationApi',
      apiUrl: '${baseUrl}/reset_password_verification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResetPasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? newpassword = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "newpassword": "${newpassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResetPasswordApi',
      apiUrl: '${baseUrl}/reset_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class DeleteUserApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteUserApi',
      apiUrl: '${baseUrl}/delete_user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignOutApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignOutApi',
      apiUrl: '${baseUrl}/signout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class EditProfileApiCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? firstname = '',
    String? lastname = '',
    String? countryCode = '',
    String? phone = '',
    String? image = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "id": "${id}",
  "firstname": "${firstname}",
  "lastname": "${lastname}",
  "country_code": "${countryCode}",
  "phone": "${phone}",
  "image": "${image}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditProfileApi',
      apiUrl: '${baseUrl}/edit_user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class UploadImageApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UploadImageApi',
      apiUrl: '${baseUrl}/upload_image',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePasswordApi',
      apiUrl: '${baseUrl}/change_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddAddressApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? zipcode = '',
    String? country = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "type": "${type}",
  "street": "${street}",
  "city": "${city}",
  "state": "${state}",
  "zipcode": "${zipcode}",
  "country": "${country}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddAddressApi',
      apiUrl: '${baseUrl}/add_address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SetDefaultAddressApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? addressId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "addressId": "${addressId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SetDefaultAddressApi',
      apiUrl: '${baseUrl}/set_default_address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetAddressApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAddressApi',
      apiUrl: '${baseUrl}/get_address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? addressDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.addressDetails''',
        true,
      ) as List?;
}

class IntrosApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'IntrosApi',
      apiUrl: '${baseUrl}/intros',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? introDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.introDetails''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

class VehicleTypesApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'VehicleTypesApi',
      apiUrl: '${baseUrl}/vehicle_types',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? vehicleDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.vehicleDetails''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

class GetTimingsApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetTimingsApi',
      apiUrl: '${baseUrl}/time_slots',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  dynamic? timeSlotDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.timeSlotDetails''',
      );
}

class ServicesApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ServicesApi',
      apiUrl: '${baseUrl}/services',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? serviceDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.serviceDetails''',
        true,
      ) as List?;
}

class PackagesByServiceApiCall {
  Future<ApiCallResponse> call({
    String? serviceId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "serviceId": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PackagesByServiceApi',
      apiUrl: '${baseUrl}/packages_by_service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? packageDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.packageDetails''',
        true,
      ) as List?;
}

class PackageDetailsApiCall {
  Future<ApiCallResponse> call({
    String? packageId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "packageId": "${packageId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PackageDetailsApi',
      apiUrl: '${baseUrl}/package_details',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.packageDetails[:].description''',
      ));
  List? galleryImagesList(dynamic response) => getJsonField(
        response,
        r'''$.data.packageDetails[:].gallery_images''',
        true,
      ) as List?;
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.packageDetails[:].image''',
      ));
}

class SearchServiceApiCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "search": "${search}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchServiceApi',
      apiUrl: '${baseUrl}/search_package',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? packageDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.PackageDetails''',
        true,
      ) as List?;
}

class BannersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Banners',
      apiUrl: '${baseUrl}/banners',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? bannerDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.bannerDetails''',
        true,
      ) as List?;
}

class BannersByServiceApiCall {
  Future<ApiCallResponse> call({
    String? serviceId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "serviceId": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BannersByServiceApi',
      apiUrl: '${baseUrl}/banners_by_service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? bannerDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.bannerDetails''',
        true,
      ) as List?;
}

class AddVehicleApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? vehicleName = '',
    String? vehicleNumber = '',
    String? vehicleTypeId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "vehicle_name": "${vehicleName}",
  "vehicle_number": "${vehicleNumber}",
  "vehicleTypeId": "${vehicleTypeId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddVehicleApi',
      apiUrl: '${baseUrl}/add_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SetDefaultVehicleApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? vehicleId = '',
    String? vehicleNumber = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "vehicleId": "${vehicleId}",
  "vehicle_number": "${vehicleNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SetDefaultVehicleApi',
      apiUrl: '${baseUrl}/set_default_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class VehicleListApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VehicleListApi',
      apiUrl: '${baseUrl}/get_vehicle_list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? vehicleDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.vehicleDetails''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  bool? isDefault(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.vehicleDetails[:].is_default''',
      ));
}

class PaymentGatewayApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PaymentGatewayApi',
      apiUrl: '${baseUrl}/payment_gateway',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? paymentMethodList(dynamic response) => getJsonField(
        response,
        r'''$.data.paymentMethod''',
        true,
      ) as List?;
  String? paypalPublicKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].paypal.paypal_public_key''',
      ));
  String? paypalPrivateKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].paypal.paypal_private_key''',
      ));
  int? paypalIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].paypal.paypal_is_enable''',
      ));
  int? razorpayIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].razorpay.razorpay_is_enable''',
      ));
  String? razorpayKeyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].razorpay.razorpay_key_Id''',
      ));
  String? razorpayKeySecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].razorpay.razorpay_key_secret''',
      ));
  int? stripeIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].stripe.stripe_is_enable''',
      ));
  String? stripePublishableKey(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].stripe.stripe_publishable_key''',
      ));
  String? stripeSecretKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethod[:].stripe.stripe_secret_key''',
      ));
}

class GetCouponsApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCouponsApi',
      apiUrl: '${baseUrl}/coupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? couponDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.couponDetails''',
        true,
      ) as List?;
  List<double>? couponAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data.couponDetails[:].coupon_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class ApplyCouponApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? couponCode = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "coupon_code": "${couponCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ApplyCouponApi',
      apiUrl: '${baseUrl}/apply_coupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class StandardRateApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StandardRateApi',
      apiUrl: '${baseUrl}/standard_rate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? rateDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.rateDetails''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? taxName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.rateDetails[:].tax_name''',
      ));
  String? countryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.rateDetails[:].country_code''',
      ));
  String? taxRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.rateDetails[:].tax_rate''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.rateDetails[:].id''',
      ));
}

class BookAVehicleCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? username = '',
    String? email = '',
    String? addressId = '',
    String? type = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? zipcode = '',
    String? country = '',
    String? vehicleId = '',
    String? vehicleName = '',
    String? vehicleNumber = '',
    String? serviceId = '',
    String? name = '',
    String? image = '',
    String? packageId = '',
    String? title = '',
    String? packageImage = '',
    double? price,
    String? bookingDate = '',
    String? bookingTime = '',
    String? paymentMode = '',
    String? transactionId = '',
    String? paymentStatus = '',
    String? orderStatus = '',
    double? subTotal,
    String? couponCode = '',
    String? couponType = '',
    double? couponAmount,
    double? vat,
    double? total,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "user": {
    "userId": "${userId}",
    "username": "${username}",
    "email": "${email}"
  },
  "address": {
    "addressId": "${addressId}",
    "type": "${type}",
    "street": "${street}",
    "city": "${city}",
    "state": "${state}",
    "zipcode": "${zipcode}",
    "country": "${country}"
  },
  "vehicle": {
    "vehicleId": "${vehicleId}",
    "vehicle_name": "${vehicleName}",
    "vehicle_number": "${vehicleNumber}"
  },
  "service": {
    "serviceId": "${serviceId}",
    "name": "${name}",
    "image": "${image}"
  },
  "package": {
    "packageId": "${packageId}",
    "title": "${title}",
    "image": "${packageImage}",
    "price": ${price}
  },
  "bookingDate": "${bookingDate}",
  "bookingTime": "${bookingTime}",
  "paymentMode": "${paymentMode}",
  "transactionId": "${transactionId}",
  "paymentStatus": "${paymentStatus}",
  "orderStatus": "${orderStatus}",
  "subTotal": ${subTotal},
  "coupon_code": "${couponCode}",
  "coupon_type": "${couponType}",
  "coupon_amount": ${couponAmount},
  "VAT": ${vat},
  "Total": ${total}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BookAVehicle',
      apiUrl: '${baseUrl}/book_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetBookedDetailsApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetBookedDetailsApi',
      apiUrl: '${baseUrl}/booked_details',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? bookingDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.BookingDetails''',
        true,
      ) as List?;
}

class OngoingOrdersApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OngoingOrdersApi',
      apiUrl: '${baseUrl}/ongoing_orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? bookingDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.BookingDetails''',
        true,
      ) as List?;
}

class CompletedOrdersApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CompletedOrdersApi',
      apiUrl: '${baseUrl}/completed_orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? bookingDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.BookingDetails''',
        true,
      ) as List?;
}

class RefundedOrderApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? bookingId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "bookingId": "${bookingId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RefundedOrderApi',
      apiUrl: '${baseUrl}/refunded_order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class AddReviewApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? packageId = '',
    String? description = '',
    String? date = '',
    String? time = '',
    int? rating,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "packageId": "${packageId}",
  "description": "${description}",
  "date": "${date}",
  "time": "${time}",
  "rating": ${rating}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddReviewApi',
      apiUrl: '${baseUrl}/add_review',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReviewApiCall {
  Future<ApiCallResponse> call({
    String? packageId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "packageId": "${packageId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetReviewApi',
      apiUrl: '${baseUrl}/get_review',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserApi',
      apiUrl: '${baseUrl}/get_user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstname''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastname''',
      ));
  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.username''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  String? countrycode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country_code''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.id''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class AllPackagesApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllPackagesApi',
      apiUrl: '${baseUrl}/packages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? packageDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.packageDetails''',
        true,
      ) as List?;
}

class AvailableSlotsApiCall {
  Future<ApiCallResponse> call({
    String? bookingDate = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "bookingDate": "${bookingDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AvailableSlotsApi',
      apiUrl: '${baseUrl}/available_slots',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? availableSlotsList(dynamic response) => getJsonField(
        response,
        r'''$.data.availableSlots''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class BookAVehicleNoCouponCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? username = '',
    String? email = '',
    String? addressId = '',
    String? type = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? zipcode = '',
    String? country = '',
    String? vehicleId = '',
    String? vehicleName = '',
    String? vehicleNumber = '',
    String? serviceId = '',
    String? name = '',
    String? image = '',
    String? packageId = '',
    String? title = '',
    String? packageImage = '',
    double? price,
    String? bookingDate = '',
    String? bookingTime = '',
    String? paymentMode = '',
    String? transactionId = '',
    String? paymentStatus = '',
    String? orderStatus = '',
    double? subTotal,
    double? vat,
    double? total,
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "user": {
    "userId": "${userId}",
    "username": "${username}",
    "email": "${email}"
  },
  "address": {
    "addressId": "${addressId}",
    "type": "${type}",
    "street": "${street}",
    "city": "${city}",
    "state": "${state}",
    "zipcode": "${zipcode}",
    "country": "${country}"
  },
  "vehicle": {
    "vehicleId": "${vehicleId}",
    "vehicle_name": "${vehicleName}",
    "vehicle_number": "${vehicleNumber}"
  },
  "service": {
    "serviceId": "${serviceId}",
    "name": "${name}",
    "image": "${image}"
  },
  "package": {
    "packageId": "${packageId}",
    "title": "${title}",
    "image": "${packageImage}",
    "price": ${price}
  },
  "bookingDate": "${bookingDate}",
  "bookingTime": "${bookingTime}",
  "paymentMode": "${paymentMode}",
  "transactionId": "${transactionId}",
  "paymentStatus": "${paymentStatus}",
  "orderStatus": "${orderStatus}",
  "subTotal": ${subTotal},
  "VAT": ${vat},
  "Total": ${total}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BookAVehicleNoCoupon',
      apiUrl: '${baseUrl}/book_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CancelOrderApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? bookingId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "bookingId": "${bookingId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancelOrderApi',
      apiUrl: '${baseUrl}/cancel_order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CancelledOrdersListApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancelledOrdersListApi',
      apiUrl: '${baseUrl}/cancelled_orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? bookingDetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.BookingDetails''',
        true,
      ) as List?;
}

class CurrencyApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CurrencyApi',
      apiUrl: '${baseUrl}/currency',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.currencydetails[:].currency''',
      ));
}

class PagesApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PagesApi',
      apiUrl: '${baseUrl}/pages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? privacyPolicy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.pagesDetails[:].privacy_policy''',
      ));
  String? termsCondition(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.pagesDetails[:].terms_condition''',
      ));
  String? about(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.pagesDetails[:].about''',
      ));
  String? help(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.pagesDetails[:].help''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

class EditAddressApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? addressId = '',
    String? type = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? zipcode = '',
    String? country = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "addressId": "${addressId}",
  "type": "${type}",
  "street": "${street}",
  "city": "${city}",
  "state": "${state}",
  "zipcode": "${zipcode}",
  "country": "${country}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditAddressApi',
      apiUrl: '${baseUrl}/edit_address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class DeleteAddressApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? addressId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "addressId": "${addressId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteAddressApi',
      apiUrl: '${baseUrl}/delete_address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class EditVehicleApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? vehicleId = '',
    String? vehicleName = '',
    String? vehicleNumber = '',
    String? vehicleTypeId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "vehicleId": "${vehicleId}",
  "vehicle_name": "${vehicleName}",
  "vehicle_number": "${vehicleNumber}",
  "vehicleTypeId": "${vehicleTypeId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditVehicleApi',
      apiUrl: '${baseUrl}/edit_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class DeleteVehicleApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? vehicleId = '',
    String? token = '',
  }) async {
    final baseUrl = CarServiceGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "vehicleId": "${vehicleId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteVehicleApi',
      apiUrl: '${baseUrl}/delete_vehicle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

/// End Car Service Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
