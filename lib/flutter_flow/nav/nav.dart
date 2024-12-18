import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => SplashPageWidget(),
        ),
        FFRoute(
          name: 'HomeMainPage',
          path: '/homeMainPage',
          builder: (context, params) => HomeMainPageWidget(),
        ),
        FFRoute(
          name: 'SignInPage',
          path: '/signInPage',
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: 'SplashPage',
          path: '/splashPage',
          builder: (context, params) => SplashPageWidget(),
        ),
        FFRoute(
          name: 'OnboardingPage',
          path: '/onboardingPage',
          builder: (context, params) => OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'SignUpPage',
          path: '/signUpPage',
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: 'ForgotPasswordPage',
          path: '/forgotPasswordPage',
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: 'VerificationPage',
          path: '/verificationPage',
          builder: (context, params) => VerificationPageWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ResetPasswordPage',
          path: '/resetPasswordPage',
          builder: (context, params) => ResetPasswordPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SelectVehicleTypePage',
          path: '/selectVehicleTypePage',
          builder: (context, params) => SelectVehicleTypePageWidget(),
        ),
        FFRoute(
          name: 'CarDetailsPage',
          path: '/carDetailsPage',
          builder: (context, params) => CarDetailsPageWidget(
            vehicleTypeId: params.getParam(
              'vehicleTypeId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RecommendedServicePage',
          path: '/recommendedServicePage',
          builder: (context, params) => RecommendedServicePageWidget(),
        ),
        FFRoute(
          name: 'MaintainYourCarPage',
          path: '/maintainYourCarPage',
          builder: (context, params) => MaintainYourCarPageWidget(),
        ),
        FFRoute(
          name: 'AllCarDetailsPage',
          path: '/allCarDetailsPage',
          builder: (context, params) => AllCarDetailsPageWidget(
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageName: params.getParam(
              'packageName',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SelectTmeDatePage',
          path: '/selectTmeDatePage',
          builder: (context, params) => SelectTmeDatePageWidget(
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CheckoutPage',
          path: '/checkoutPage',
          builder: (context, params) => CheckoutPageWidget(
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PaymentMethodPage',
          path: '/paymentMethodPage',
          builder: (context, params) => PaymentMethodPageWidget(
            total: params.getParam(
              'total',
              ParamType.double,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            street: params.getParam(
              'street',
              ParamType.String,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
            state: params.getParam(
              'state',
              ParamType.String,
            ),
            zipcode: params.getParam(
              'zipcode',
              ParamType.String,
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            subTotal: params.getParam(
              'subTotal',
              ParamType.double,
            ),
            vat: params.getParam(
              'vat',
              ParamType.double,
            ),
            couponCode: params.getParam(
              'couponCode',
              ParamType.String,
            ),
            couponType: params.getParam(
              'couponType',
              ParamType.String,
            ),
            couponAmount: params.getParam(
              'couponAmount',
              ParamType.double,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyOrderDetailPage',
          path: '/myOrderDetailPage',
          builder: (context, params) => MyOrderDetailPageWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            bookingId: params.getParam(
              'bookingId',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyProfilePage',
          path: '/myProfilePage',
          builder: (context, params) => MyProfilePageWidget(),
        ),
        FFRoute(
          name: 'EditProfilePage',
          path: '/editProfilePage',
          builder: (context, params) => EditProfilePageWidget(),
        ),
        FFRoute(
          name: 'AddressPage',
          path: '/addressPage',
          builder: (context, params) => AddressPageWidget(),
        ),
        FFRoute(
          name: 'AddNewAddressPage',
          path: '/addNewAddressPage',
          builder: (context, params) => AddNewAddressPageWidget(),
        ),
        FFRoute(
          name: 'MyCarsPage',
          path: '/myCarsPage',
          builder: (context, params) => MyCarsPageWidget(),
        ),
        FFRoute(
          name: 'BannerPage',
          path: '/bannerPage',
          builder: (context, params) => BannerPageWidget(
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SettingPage',
          path: '/settingPage',
          builder: (context, params) => SettingPageWidget(),
        ),
        FFRoute(
          name: 'AboutUsPage',
          path: '/aboutUsPage',
          builder: (context, params) => AboutUsPageWidget(),
        ),
        FFRoute(
          name: 'TermsConditionPage',
          path: '/termsConditionPage',
          builder: (context, params) => TermsConditionPageWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicyPage',
          path: '/privacyPolicyPage',
          builder: (context, params) => PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: 'EditAddressPage',
          path: '/editAddressPage',
          builder: (context, params) => EditAddressPageWidget(
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            street: params.getParam(
              'street',
              ParamType.String,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
            state: params.getParam(
              'state',
              ParamType.String,
            ),
            zipcode: params.getParam(
              'zipcode',
              ParamType.String,
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgotVerificationPage',
          path: '/forgotVerificationPage',
          builder: (context, params) => ForgotVerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ChangeAddressPage',
          path: '/changeAddressPage',
          builder: (context, params) => ChangeAddressPageWidget(
            street: params.getParam(
              'street',
              ParamType.String,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
            state: params.getParam(
              'state',
              ParamType.String,
            ),
            zipcode: params.getParam(
              'zipcode',
              ParamType.String,
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyCouponPage',
          path: '/myCouponPage',
          builder: (context, params) => MyCouponPageWidget(),
        ),
        FFRoute(
          name: 'PaymentFailedPage',
          path: '/paymentFailedPage',
          builder: (context, params) => PaymentFailedPageWidget(),
        ),
        FFRoute(
          name: 'PaymentSuccessPage',
          path: '/paymentSuccessPage',
          builder: (context, params) => PaymentSuccessPageWidget(
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            addressType: params.getParam(
              'addressType',
              ParamType.String,
            ),
            addressStreet: params.getParam(
              'addressStreet',
              ParamType.String,
            ),
            addressCity: params.getParam(
              'addressCity',
              ParamType.String,
            ),
            addresState: params.getParam(
              'addresState',
              ParamType.String,
            ),
            addresZipcode: params.getParam(
              'addresZipcode',
              ParamType.String,
            ),
            addressCountry: params.getParam(
              'addressCountry',
              ParamType.String,
            ),
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            paymentMode: params.getParam(
              'paymentMode',
              ParamType.String,
            ),
            transactionId: params.getParam(
              'transactionId',
              ParamType.String,
            ),
            paymentStatus: params.getParam(
              'paymentStatus',
              ParamType.String,
            ),
            orderStatus: params.getParam(
              'orderStatus',
              ParamType.String,
            ),
            subTotal: params.getParam(
              'subTotal',
              ParamType.double,
            ),
            couponCode: params.getParam(
              'couponCode',
              ParamType.String,
            ),
            couponType: params.getParam(
              'couponType',
              ParamType.String,
            ),
            couponAmount: params.getParam(
              'couponAmount',
              ParamType.double,
            ),
            vat: params.getParam(
              'vat',
              ParamType.double,
            ),
            total: params.getParam(
              'total',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'PaymentGatewayPage',
          path: '/paymentGatewayPage',
          builder: (context, params) => PaymentGatewayPageWidget(
            total: params.getParam(
              'total',
              ParamType.double,
            ),
            paymentToName: params.getParam(
              'paymentToName',
              ParamType.String,
            ),
            paymentMethod: params.getParam(
              'paymentMethod',
              ParamType.String,
            ),
            stripeSecretKey: params.getParam(
              'stripeSecretKey',
              ParamType.String,
            ),
            stripePublishableKey: params.getParam(
              'stripePublishableKey',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            addressType: params.getParam(
              'addressType',
              ParamType.String,
            ),
            addressStreet: params.getParam(
              'addressStreet',
              ParamType.String,
            ),
            addressCity: params.getParam(
              'addressCity',
              ParamType.String,
            ),
            addressState: params.getParam(
              'addressState',
              ParamType.String,
            ),
            addressZipcode: params.getParam(
              'addressZipcode',
              ParamType.String,
            ),
            addressCountry: params.getParam(
              'addressCountry',
              ParamType.String,
            ),
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            subTotal: params.getParam(
              'subTotal',
              ParamType.double,
            ),
            vat: params.getParam(
              'vat',
              ParamType.double,
            ),
            couponCode: params.getParam(
              'couponCode',
              ParamType.String,
            ),
            couponType: params.getParam(
              'couponType',
              ParamType.String,
            ),
            couponAmount: params.getParam(
              'couponAmount',
              ParamType.double,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SelectTmeDatePageCopy',
          path: '/selectTmeDatePageCopy',
          builder: (context, params) => SelectTmeDatePageCopyWidget(
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CarDetailsEditPage',
          path: '/carDetailsEditPage',
          builder: (context, params) => CarDetailsEditPageWidget(
            vehicleTypeId: params.getParam(
              'vehicleTypeId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SelectVehicleTypeEditPage',
          path: '/selectVehicleTypeEditPage',
          builder: (context, params) => SelectVehicleTypeEditPageWidget(
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            vehicleTypeId: params.getParam(
              'vehicleTypeId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyOrderConfirmPage',
          path: '/myOrderConfirmPage',
          builder: (context, params) => MyOrderConfirmPageWidget(),
        ),
        FFRoute(
          name: 'CheckoutPageCopy',
          path: '/checkoutPageCopy',
          builder: (context, params) => CheckoutPageCopyWidget(
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageTitle: params.getParam(
              'packageTitle',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NotificationPage',
          path: '/notificationPage',
          builder: (context, params) => NotificationPageWidget(),
        ),
        FFRoute(
          name: 'PaymentGatewayPageCopy',
          path: '/paymentGatewayPageCopy',
          builder: (context, params) => PaymentGatewayPageCopyWidget(
            total: params.getParam(
              'total',
              ParamType.double,
            ),
            paymentToName: params.getParam(
              'paymentToName',
              ParamType.String,
            ),
            paymentMethod: params.getParam(
              'paymentMethod',
              ParamType.String,
            ),
            stripeSecretKey: params.getParam(
              'stripeSecretKey',
              ParamType.String,
            ),
            stripePublishableKey: params.getParam(
              'stripePublishableKey',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            addressType: params.getParam(
              'addressType',
              ParamType.String,
            ),
            addressStreet: params.getParam(
              'addressStreet',
              ParamType.String,
            ),
            addressCity: params.getParam(
              'addressCity',
              ParamType.String,
            ),
            addressState: params.getParam(
              'addressState',
              ParamType.String,
            ),
            addressZipcode: params.getParam(
              'addressZipcode',
              ParamType.String,
            ),
            addressCountry: params.getParam(
              'addressCountry',
              ParamType.String,
            ),
            vehicleId: params.getParam(
              'vehicleId',
              ParamType.String,
            ),
            vehicleName: params.getParam(
              'vehicleName',
              ParamType.String,
            ),
            vehicleNumber: params.getParam(
              'vehicleNumber',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.String,
            ),
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
            serviceImage: params.getParam(
              'serviceImage',
              ParamType.String,
            ),
            packageId: params.getParam(
              'packageId',
              ParamType.String,
            ),
            packageImage: params.getParam(
              'packageImage',
              ParamType.String,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.String,
            ),
            subTotal: params.getParam(
              'subTotal',
              ParamType.double,
            ),
            vat: params.getParam(
              'vat',
              ParamType.double,
            ),
            couponCode: params.getParam(
              'couponCode',
              ParamType.String,
            ),
            couponType: params.getParam(
              'couponType',
              ParamType.String,
            ),
            couponAmount: params.getParam(
              'couponAmount',
              ParamType.double,
            ),
            packagePrice: params.getParam(
              'packagePrice',
              ParamType.double,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
