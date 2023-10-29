// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:bookapp/Features/Auth/Screens/login_screen.dart' as _i4;
import 'package:bookapp/Features/Auth/Screens/register_screen.dart' as _i6;
import 'package:bookapp/Features/Book/BooksRepository/response.dart' as _i10;
import 'package:bookapp/Features/Book/Models/product_model.dart' as _i9;
import 'package:bookapp/Features/Book/Screens/book_deatils_screen.dart' as _i1;
import 'package:bookapp/Features/Book/Screens/category_screen.dart' as _i2;
import 'package:bookapp/Features/Book/Screens/home_screen.dart' as _i3;
import 'package:bookapp/Features/Book/Screens/opening_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    BookDetails.name: (routeData) {
      final args = routeData.argsAs<BookDetailsArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BookDetails(
          key: args.key,
          product: args.product,
          url: args.url,
        ),
      );
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoryScreen(
          key: args.key,
          categoryName: args.categoryName,
          productList: args.productList,
          urlList: args.urlList,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    OpeningRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OpeningScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookDetails]
class BookDetails extends _i7.PageRouteInfo<BookDetailsArgs> {
  BookDetails({
    _i8.Key? key,
    required _i9.Product product,
    required String url,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          BookDetails.name,
          args: BookDetailsArgs(
            key: key,
            product: product,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetails';

  static const _i7.PageInfo<BookDetailsArgs> page =
      _i7.PageInfo<BookDetailsArgs>(name);
}

class BookDetailsArgs {
  const BookDetailsArgs({
    this.key,
    required this.product,
    required this.url,
  });

  final _i8.Key? key;

  final _i9.Product product;

  final String url;

  @override
  String toString() {
    return 'BookDetailsArgs{key: $key, product: $product, url: $url}';
  }
}

/// generated route for
/// [_i2.CategoryScreen]
class CategoryRoute extends _i7.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    _i8.Key? key,
    required String? categoryName,
    required List<_i9.Product>? productList,
    required Map<String, _i10.ResponseModel<String>> urlList,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CategoryRoute.name,
          args: CategoryRouteArgs(
            key: key,
            categoryName: categoryName,
            productList: productList,
            urlList: urlList,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i7.PageInfo<CategoryRouteArgs> page =
      _i7.PageInfo<CategoryRouteArgs>(name);
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.categoryName,
    required this.productList,
    required this.urlList,
  });

  final _i8.Key? key;

  final String? categoryName;

  final List<_i9.Product>? productList;

  final Map<String, _i10.ResponseModel<String>> urlList;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryName: $categoryName, productList: $productList, urlList: $urlList}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OpeningScreen]
class OpeningRoute extends _i7.PageRouteInfo<void> {
  const OpeningRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OpeningRoute.name,
          initialChildren: children,
        );

  static const String name = 'OpeningRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
