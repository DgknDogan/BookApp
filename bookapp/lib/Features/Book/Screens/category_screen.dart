import 'package:auto_route/auto_route.dart';
import 'package:bookapp/Features/Book/BooksRepository/response.dart';
import 'package:bookapp/Features/Book/Models/product_model.dart';
import 'package:bookapp/Features/Book/cubit/book_cubit.dart';
import 'package:bookapp/Routes/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  final String? categoryName;
  final List<Product>? productList;
  final Map<String, ResponseModel<String>> urlList;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.productList,
    required this.urlList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 85.h,
        leading: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            iconSize: 40.r,
            color: const Color(0xff090937),
            onPressed: () {
              AutoRouter.of(context).pop();
            },
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(top: 20.h),
            margin: EdgeInsets.only(right: 20.w),
            alignment: Alignment.centerLeft,
            child: Text(
              categoryName.toString(),
              style: TextStyle(
                color: const Color(0xFF090937),
                fontSize: 20.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => BookCubit(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 33.h)),
                _CategorySearchBar(categoryName: categoryName),
                Padding(padding: EdgeInsets.only(top: 40.h)),
                BookGrid(
                  categoryName: categoryName,
                  urlList: urlList,
                  productList: productList,
                ),
                Padding(padding: EdgeInsets.only(top: 20.h))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategorySearchBar extends StatelessWidget {
  final String? categoryName;
  const _CategorySearchBar({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: SearchBar(
        onChanged: (letters) => context
            .read<BookCubit>()
            .onProductSearchbarChanged(letters, categoryName),
        leading: const Icon(Icons.search, color: Color.fromRGBO(9, 9, 55, 0.4)),
        hintText: "Search",
        hintStyle: MaterialStateProperty.all(
          TextStyle(
            color: const Color(0x66090937),
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: MaterialStateProperty.all(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xffF4F4FF),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        trailing: [SvgPicture.asset("assets/Filter.svg")],
      ),
    );
  }
}

class BookGrid extends StatelessWidget {
  final String? categoryName;
  final List<Product>? productList;
  final Map<String, ResponseModel<String>> urlList;

  const BookGrid({
    super.key,
    required this.categoryName,
    required this.productList,
    required this.urlList,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookCubit>().state;
    return state.filteredProductsList.isEmpty
        ? GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 170.w / 284.h,
            children: [
              ...productList!.map((product) {
                return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      BookDetails(
                        product: product,
                        url: urlList[product.cover]!.model.toString(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF4F4FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Image.network(
                            urlList[product.cover.toString()]!.model.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name.toString(),
                              style: TextStyle(
                                color: const Color(0xFF090937),
                                fontSize: 10.sp,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    product.author.toString(),
                                    style: TextStyle(
                                      color: const Color(0x99090937),
                                      fontSize: 8.sp,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${product.price}\$",
                                  style: TextStyle(
                                    color: const Color(0xFF6251DD),
                                    fontSize: 12.sp,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          )
        : GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 170.w / 280.h,
            children: [
              ...state.filteredProductsList.map(
                (product) {
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(
                        BookDetails(
                          product: product,
                          url: urlList[product.cover]!.model.toString(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            urlList[product.cover.toString()]!.model.toString(),
                            width: 170.w,
                            height: 225.h,
                            fit: BoxFit.contain,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.toString(),
                                  style: TextStyle(
                                    color: const Color(0xFF090937),
                                    fontSize: 10.sp,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.author.toString(),
                                      style: TextStyle(
                                        color: const Color(0x99090937),
                                        fontSize: 8.sp,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${product.price}\$",
                                      style: TextStyle(
                                        color: const Color(0xFF6251DD),
                                        fontSize: 12.sp,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
