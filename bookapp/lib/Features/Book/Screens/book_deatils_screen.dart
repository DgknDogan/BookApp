import 'package:auto_route/auto_route.dart';
import 'package:bookapp/Features/Book/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class BookDetails extends StatefulWidget {
  final Product product;
  final String url;
  const BookDetails({
    super.key,
    required this.product,
    required this.url,
  });

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  Color colorAfter = const Color(0xff6251DD);
  Color colorBefore = const Color(0xaa6251cc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            iconSize: 40,
            color: const Color(0xff090937),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Book Details",
              style: TextStyle(
                color: Color(0xFF090937),
                fontSize: 20,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20.h)),
              _BookCoverImage(url: widget.url),
              _BookAuthorNameText(product: widget.product),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              _Summary(product: widget.product),
              _BuyNowButton(product: widget.product),
              Padding(padding: EdgeInsets.only(top: 40.h)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookCoverImage extends StatelessWidget {
  final String url;
  const _BookCoverImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SvgPicture.asset(
              "assets/heart_button.svg",
              fit: BoxFit.contain,
            ),
            iconSize: 50.r,
            onPressed: () {},
          ),
        ),
        Center(
          child: Image.network(
            url,
            width: 170.w,
            height: 245.h,
          ),
        ),
      ],
    );
  }
}

class _BookAuthorNameText extends StatelessWidget {
  final Product product;
  const _BookAuthorNameText({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.name.toString(),
          style: TextStyle(
            color: const Color(0xFF090937),
            fontSize: 20.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10.h)),
        Text(
          product.author.toString(),
          style: TextStyle(
            color: const Color(0x99090937),
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  final Product product;
  const _Summary({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(
            color: const Color(0xFF090937),
            fontSize: 20.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          product.description.toString(),
          style: TextStyle(
            color: const Color(0x99090937),
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            height: 1.62.h,
          ),
        ),
      ],
    );
  }
}

class _BuyNowButton extends StatelessWidget {
  final Product product;
  const _BuyNowButton({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(0xffef6b4a),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${product.price}\$",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Buy Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
