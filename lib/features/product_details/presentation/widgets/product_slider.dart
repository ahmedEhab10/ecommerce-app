import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resources/color_manager.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider(
      {super.key, required this.initialIndex, required this.imagesurl});

  final int initialIndex;
  final List<String> imagesurl;

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          controller: _controller,
          items: widget.imagesurl.map((Image) {
            return ProductItem(
              imageUrl: Image,
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 199.w / 150.h,
            initialPage: widget.initialIndex,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.imagesurl.length,
            duration: const Duration(microseconds: 0),
            effect: ExpandingDotsEffect(
              dotWidth: 7.w,
              dotHeight: 7.h,
              dotColor: Colors.grey.shade400,
              paintStyle: PaintingStyle.fill,
              activeDotColor: ColorManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
