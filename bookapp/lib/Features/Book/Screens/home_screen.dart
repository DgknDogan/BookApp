import 'package:auto_route/auto_route.dart';
import 'package:bookapp/Features/Book/Models/product_model.dart';
import 'package:bookapp/Features/Book/cubit/book_cubit.dart';
import 'package:bookapp/Routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.h,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 90.h,
          leadingWidth: 70.w,
          leading: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 0, 0),
            child: Image(
              image: const AssetImage("assets/Logo.png"),
              width: 50.w,
              height: 32.h,
            ),
          ),
          actions: [
            Container(
              width: 90.w,
              padding: EdgeInsets.only(top: 20.h),
              alignment: Alignment.centerLeft,
              child: Text(
                'Catalog',
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
        body: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: state.isLoading
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 28.h, 0, 0),
                          child: const _CategoryTabBar(),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.h)),
                        const _SearchBar(),
                        const _BookCategories(),
                        Padding(padding: EdgeInsets.only(top: 20.h))
                      ],
                    )
                  : const Center(
                      heightFactor: 15,
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _CategoryTabBar extends StatefulWidget {
  const _CategoryTabBar();

  @override
  State<_CategoryTabBar> createState() => __CategoryTabBarState();
}

class __CategoryTabBarState extends State<_CategoryTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5,
        vsync: this,
        initialIndex: 0,
        animationDuration: Duration.zero);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookCubit>().state;
    return SizedBox(
      height: 44.h,
      child: TabBar(
        isScrollable: true,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: (value) =>
            context.read<BookCubit>().onCategoryTabBarChanged(value),
        indicatorPadding: EdgeInsets.only(right: 10.w),
        labelPadding: EdgeInsets.only(right: 10.w),
        indicator: BoxDecoration(
          color: const Color(0xff6251DD),
          borderRadius: BorderRadiusDirectional.circular(4),
        ),
        labelColor: const Color(0xffffffff),
        unselectedLabelColor: const Color.fromRGBO(9, 9, 55, 0.4),
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          color: const Color(0x66090937),
          fontSize: 16.sp,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
        tabs: [
          _tabController.index == 0
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Tab(
                    text: "All",
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF4F4FF),
                      borderRadius: BorderRadius.circular(4.r)),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Tab(
                    text: "All",
                  ),
                ),
          ...state.bookCategoriesList.map(
            (category) {
              return _tabController.index == category.id!
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Tab(
                        text: category.name.toString(),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF4F4FF),
                          borderRadius: BorderRadius.circular(4.r)),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Tab(
                        text: category.name.toString(),
                      ),
                    );
            },
          ).toList(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SearchBar(
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
        onChanged: (letters) =>
            context.read<BookCubit>().onCategorySearchbarChanged(letters),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: const MaterialStatePropertyAll(Color(0xffF4F4FF)),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        trailing: [
          SvgPicture.asset(
            "assets/Filter.svg",
            height: 16.h,
            width: 16.w,
          ),
        ],
      ),
    );
  }
}

class _BookCategories extends StatelessWidget {
  const _BookCategories();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookCubit>().state;
    return state.filteredBookCategoriesList.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...state.bookCategoriesList.map(
                (category) {
                  return Container(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CategoriesHeader(
                            categoryName: category.name.toString()),
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        _CategoriesRow(categoryName: category.name.toString()),
                      ],
                    ),
                  );
                },
              ).toList(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...state.filteredBookCategoriesList.map(
                (category) {
                  return Container(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CategoriesHeader(
                            categoryName: category.name.toString()),
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        _CategoriesRow(categoryName: category.name.toString()),
                      ],
                    ),
                  );
                },
              ).toList()
            ],
          );
  }
}

class _CategoriesHeader extends StatelessWidget {
  final String categoryName;

  const _CategoriesHeader({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName,
            style: TextStyle(
              color: const Color(0xFF090937),
              fontSize: 20.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              AutoRouter.of(context).push(
                CategoryRoute(
                  categoryName: categoryName,
                  productList: context
                      .read<BookCubit>()
                      .state
                      .productsList[categoryName]!
                      .model,
                  urlList: context.read<BookCubit>().state.bookCoverUrls,
                ),
              );
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: const Color(0xFFEF6B4A),
                fontSize: 12.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CategoriesRow extends StatelessWidget {
  final String categoryName;
  const _CategoriesRow({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookCubit>().state;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: [
            ...?state.productsList[categoryName]?.model?.map(
              (product) {
                return GestureDetector(
                  onTap: () {
                    context.pushRoute(
                      BookDetails(
                        product: product,
                        url: context
                            .read<BookCubit>()
                            .state
                            .bookCoverUrls[product.cover]!
                            .model
                            .toString(),
                      ),
                    );
                    // AutoRouter.of(context).push(
                    //   BookDetails(
                    //     product: product,
                    //     url: context
                    //         .read<BookCubit>()
                    //         .state
                    //         .bookCoverUrls[product.cover]!
                    //         .model
                    //         .toString(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF4F4FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    width: 210.w,
                    height: 140.h,
                    child: _Book(
                      product: product,
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}

class _Book extends StatelessWidget {
  final Product product;
  const _Book({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          context
              .watch<BookCubit>()
              .state
              .bookCoverUrls[product.cover.toString()]!
              .model
              .toString(),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return SizedBox(
              height: 120.h,
              width: 80.w,
            );
          },
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF090937),
                        fontSize: 12.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.author.toString(),
                      style: TextStyle(
                        color: const Color(0x99090937),
                        fontSize: 10.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Text(
                    "${product.price}\$",
                    style: TextStyle(
                      color: const Color(0xFF6251DD),
                      fontSize: 16.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
