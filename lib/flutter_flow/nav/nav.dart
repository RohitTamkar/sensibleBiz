import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

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

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SplashScreenWidget(),
        ),
        FFRoute(
          name: 'OTPverification',
          path: '/oTPverification',
          builder: (context, params) => OTPverificationWidget(),
        ),
        FFRoute(
          name: 'SplashScreen',
          path: '/splashScreen',
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: 'MastersPage',
          path: '/mastersPage',
          builder: (context, params) => MastersPageWidget(),
        ),
        FFRoute(
          name: 'Account',
          path: '/account',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Account')
              : AccountWidget(),
        ),
        FFRoute(
          name: 'EditCategory',
          path: '/editCategory',
          asyncParams: {
            'catDoc':
                getDoc(['OUTLET', 'CATEGORY'], CategoryRecord.fromSnapshot),
            'categoryDocW':
                getDoc(['OUTLET', 'CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => EditCategoryWidget(
            catDoc: params.getParam(
              'catDoc',
              ParamType.Document,
            ),
            categoryDocW: params.getParam(
              'categoryDocW',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PhoneAuthPage',
          path: '/phoneAuthPage',
          builder: (context, params) => PhoneAuthPageWidget(),
        ),
        FFRoute(
          name: 'AddOutlet',
          path: '/addOutlet',
          builder: (context, params) => AddOutletWidget(
            qr: params.getParam(
              'qr',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateUserProfile',
          path: '/createUserProfile',
          builder: (context, params) => CreateUserProfileWidget(),
        ),
        FFRoute(
          name: 'EditOutlet',
          path: '/editOutlet',
          builder: (context, params) => EditOutletWidget(),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: 'ContactUs',
          path: '/contactUs',
          builder: (context, params) => ContactUsWidget(),
        ),
        FFRoute(
          name: 'TermsNcondition',
          path: '/termsNcondition',
          builder: (context, params) => TermsNconditionWidget(),
        ),
        FFRoute(
          name: 'CompanyDetails',
          path: '/companyDetails',
          builder: (context, params) => CompanyDetailsWidget(),
        ),
        FFRoute(
          name: 'OutletListPage',
          path: '/outletListPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'OutletListPage')
              : OutletListPageWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'deleteUserProfile',
          path: '/deleteUserProfile',
          builder: (context, params) => DeleteUserProfileWidget(
            mobile: params.getParam(
              'mobile',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Stock',
          path: '/stock',
          builder: (context, params) => StockWidget(),
        ),
        FFRoute(
          name: 'StockRequest',
          path: '/stockRequest',
          asyncParams: {
            'outlet': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => StockRequestWidget(
            outlet: params.getParam(
              'outlet',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'stockReport',
          path: '/stockReport',
          builder: (context, params) => StockReportWidget(),
        ),
        FFRoute(
          name: 'testingshift',
          path: '/testingshift',
          builder: (context, params) => TestingshiftWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          asyncParams: {
            'outletDetails': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Dashboard')
              : DashboardWidget(
                  outletDetails: params.getParam(
                    'outletDetails',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'Reports',
          path: '/reports',
          asyncParams: {
            'outletDetails': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Reports')
              : ReportsWidget(
                  outletDetails: params.getParam(
                    'outletDetails',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'productSaleReportDaywise',
          path: '/productSaleReportDaywise',
          builder: (context, params) => ProductSaleReportDaywiseWidget(
            prdTestList: params.getParam<dynamic>(
              'prdTestList',
              ParamType.JSON,
              isList: true,
            ),
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'categoryWiseSaleReport',
          path: '/categoryWiseSaleReport',
          builder: (context, params) => CategoryWiseSaleReportWidget(
            catTestList: params.getParam<dynamic>(
              'catTestList',
              ParamType.JSON,
              isList: true,
            ),
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'DropDownTest',
          path: '/dropDownTest',
          asyncParams: {
            'outlet': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => DropDownTestWidget(
            outlet: params.getParam(
              'outlet',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ExcelSheet',
          path: '/excelSheet',
          builder: (context, params) => ExcelSheetWidget(),
        ),
        FFRoute(
          name: 'OnboardingScreen',
          path: '/onboardingScreen',
          builder: (context, params) => OnboardingScreenWidget(),
        ),
        FFRoute(
          name: 'UploadExcelSheetPage',
          path: '/uploadExcelSheetPage',
          builder: (context, params) => UploadExcelSheetPageWidget(
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'UserManualAdmin',
          path: '/userManualAdmin',
          builder: (context, params) => UserManualAdminWidget(),
        ),
        FFRoute(
          name: 'UserManualList',
          path: '/userManualList',
          builder: (context, params) => UserManualListWidget(),
        ),
        FFRoute(
          name: 'UserManualCustomerView',
          path: '/userManualCustomerView',
          builder: (context, params) => UserManualCustomerViewWidget(),
        ),
        FFRoute(
          name: 'SplashCRM',
          path: '/splashCRM',
          builder: (context, params) => SplashCRMWidget(),
        ),
        FFRoute(
          name: 'DayWiseSaleReport',
          path: '/dayWiseSaleReport',
          builder: (context, params) => DayWiseSaleReportWidget(),
        ),
        FFRoute(
          name: 'DevicePage',
          path: '/devicePage',
          builder: (context, params) => DevicePageWidget(
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SubscriptionPage',
          path: '/subscriptionPage',
          builder: (context, params) => SubscriptionPageWidget(),
        ),
        FFRoute(
          name: 'EditUserProfile',
          path: '/editUserProfile',
          builder: (context, params) => EditUserProfileWidget(),
        ),
        FFRoute(
          name: 'CategoryList',
          path: '/categoryList',
          asyncParams: {
            'outletDetails': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => CategoryListWidget(
            outletId: params.getParam(
              'outletId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['OUTLET'],
            ),
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AddCategoryPage',
          path: '/addCategoryPage',
          builder: (context, params) => AddCategoryPageWidget(
            codeLen: params.getParam(
              'codeLen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'AddProduct',
          path: '/addProduct',
          builder: (context, params) => AddProductWidget(
            codeLen: params.getParam(
              'codeLen',
              ParamType.int,
            ),
            proRef: params.getParam(
              'proRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['OUTLET', 'PRODUCT'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditProduct',
          path: '/editProduct',
          asyncParams: {
            'proDoc': getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
            'productDocW':
                getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
          },
          builder: (context, params) => EditProductWidget(
            proDoc: params.getParam(
              'proDoc',
              ParamType.Document,
            ),
            productDocW: params.getParam(
              'productDocW',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'stockReportCopy',
          path: '/stockReportCopy',
          builder: (context, params) => StockReportCopyWidget(),
        ),
        FFRoute(
          name: 'StockUpdate',
          path: '/stockUpdate',
          asyncParams: {
            'outlet': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => StockUpdateWidget(
            outlet: params.getParam(
              'outlet',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PhoneAuthPageTest',
          path: '/phoneAuthPageTest',
          builder: (context, params) => PhoneAuthPageTestWidget(),
        ),
        FFRoute(
          name: 'OTPverificationTest',
          path: '/oTPverificationTest',
          builder: (context, params) => OTPverificationTestWidget(
            mobile: params.getParam(
              'mobile',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateUserProfileTest',
          path: '/createUserProfileTest',
          builder: (context, params) => CreateUserProfileTestWidget(
            mobile: params.getParam(
              'mobile',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stockWeightCombinePage',
          path: '/stockWeightCombinePage',
          builder: (context, params) => StockWeightCombinePageWidget(),
        ),
        FFRoute(
          name: 'taxSettings',
          path: '/taxSettings',
          builder: (context, params) => TaxSettingsWidget(),
        ),
        FFRoute(
          name: 'Discount',
          path: '/discount',
          builder: (context, params) => DiscountWidget(),
        ),
        FFRoute(
          name: 'EmployeeAllPage',
          path: '/employeeAllPage',
          builder: (context, params) => EmployeeAllPageWidget(),
        ),
        FFRoute(
          name: 'AddEmployee',
          path: '/AddEmployeePage',
          builder: (context, params) => AddEmployeeWidget(),
        ),
        FFRoute(
          name: 'EditEmployee',
          path: '/EditEmployee',
          asyncParams: {
            'ref': getDoc(['OUTLET', 'EMPLOYEE'], EmployeeRecord.fromSnapshot),
          },
          builder: (context, params) => EditEmployeeWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'StockReportam',
          path: '/StockReportam',
          builder: (context, params) => StockReportamWidget(),
        ),
        FFRoute(
          name: 'GstwiseproductsaleReport',
          path: '/gstwiseproductsaleReport',
          builder: (context, params) => GstwiseproductsaleReportWidget(
            prdTestList: params.getParam<dynamic>(
              'prdTestList',
              ParamType.JSON,
              isList: true,
            ),
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'ProductList',
          path: '/ProductList',
          asyncParams: {
            'outletDetails': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => ProductListWidget(
            outletId: params.getParam(
              'outletId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['OUTLET'],
            ),
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AddServicePoint',
          path: '/AddServicePoint',
          builder: (context, params) => AddServicePointWidget(),
        ),
        FFRoute(
          name: 'ServicePoint',
          path: '/ServicePoint',
          builder: (context, params) => ServicePointWidget(),
        ),
        FFRoute(
          name: 'EditServicePoint',
          path: '/EditServicePoint',
          asyncParams: {
            'servPtDoc': getDoc(
                ['OUTLET', 'SERVICE_POINT'], ServicePointRecord.fromSnapshot),
          },
          builder: (context, params) => EditServicePointWidget(
            servPtDoc: params.getParam(
              'servPtDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SaveExcelSheet',
          path: '/saveExcelSheet',
          builder: (context, params) => SaveExcelSheetWidget(
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Premises',
          path: '/Premises',
          asyncParams: {
            'outletDetails': getDoc(['OUTLET'], OutletRecord.fromSnapshot),
          },
          builder: (context, params) => PremisesWidget(
            outletId: params.getParam(
              'outletId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['OUTLET'],
            ),
            outletDetails: params.getParam(
              'outletDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AddPremises',
          path: '/addPremises',
          builder: (context, params) => AddPremisesWidget(
            codeLen: params.getParam(
              'codeLen',
              ParamType.int,
            ),
            proRef: params.getParam(
              'proRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['OUTLET', 'PRODUCT'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditPremises',
          path: '/editPremises',
          asyncParams: {
            'premDoc':
                getDoc(['OUTLET', 'PREMISES'], PremisesRecord.fromSnapshot),
          },
          builder: (context, params) => EditPremisesWidget(
            premDoc: params.getParam(
              'premDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'dataExchange',
          path: '/dataExchange',
          builder: (context, params) => DataExchangeWidget(),
        ),
        FFRoute(
          name: 'GstPrdRprtCustDate',
          path: '/gstPrdRprtCustDate',
          builder: (context, params) => GstPrdRprtCustDateWidget(
            prdTestList: params.getParam<dynamic>(
              'prdTestList',
              ParamType.JSON,
              isList: true,
            ),
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
            start: params.getParam(
              'start',
              ParamType.DateTime,
            ),
            end: params.getParam(
              'end',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerPage',
          path: '/customerPage',
          builder: (context, params) => CustomerPageWidget(),
        ),
        FFRoute(
          name: 'EditCustomer',
          path: '/EditCustomer',
          asyncParams: {
            'ref': getDoc(['OUTLET', 'CUSTOMER'], CustomerRecord.fromSnapshot),
          },
          builder: (context, params) => EditCustomerWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AddCustomer',
          path: '/AddCustomer',
          builder: (context, params) => AddCustomerWidget(),
        ),
        FFRoute(
          name: 'PremisesShow',
          path: '/premisesShow',
          builder: (context, params) => PremisesShowWidget(),
        ),
        FFRoute(
          name: 'LoginCopy',
          path: '/loginCopy',
          builder: (context, params) => LoginCopyWidget(),
        ),
        FFRoute(
          name: 'ExcelSheetpremises',
          path: '/excelSheetpremises',
          builder: (context, params) => ExcelSheetpremisesWidget(),
        ),
        FFRoute(
          name: 'BillWiseSaleReport',
          path: '/billWiseSaleReport',
          builder: (context, params) => BillWiseSaleReportWidget(),
        ),
        FFRoute(
          name: 'userList',
          path: '/userList',
          builder: (context, params) => UserListWidget(),
        ),
        FFRoute(
          name: 'addUser',
          path: '/addUser',
          builder: (context, params) => AddUserWidget(),
        ),
        FFRoute(
          name: 'editUser',
          path: '/editUser',
          builder: (context, params) => EditUserWidget(
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['USER_PROFILE'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
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
    List<String>? collectionNamePath,
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
      collectionNamePath: collectionNamePath,
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).warning,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 450),
      );
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
