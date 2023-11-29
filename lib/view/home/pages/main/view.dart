import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/features/categories/bloc.dart';
import 'package:thimar_app/features/categories/states.dart';
import 'package:thimar_app/features/products/bloc.dart';
import 'package:thimar_app/features/products/model.dart';
import 'package:thimar_app/features/products/states.dart';
import 'package:thimar_app/features/slider/bloc.dart';
import 'package:thimar_app/features/slider/states.dart';
import 'package:thimar_app/shared/design/app_input.dart';
import 'package:thimar_app/shared/logic/cache_helper.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/login/view.dart';
import '../../../../features/categories/model.dart';
import '../../../../shared/design/app_button.dart';
import '../../../../shared/design/app_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppInput(
              labelText: "ابحث عن ماتريد؟",
              icon: "assets/icons/svg/line-search.svg",
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<GetSliderCubit, GetSliderStates>(
            builder: (context, state) {
              if (state is GetSliderIsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetSliderSuccessState) {
                return Column(
                  children: [
                    CarouselSlider(
                      items: List.generate(
                        state.list.length,
                        (index) => AppImage(
                          state.list[index].media,
                          fit: BoxFit.fill,
                          height: 165,
                          width: double.infinity,
                        ),
                      ),
                      options: CarouselOptions(
                        reverse: true,
                        height: 165,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          currentIndex = index;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.list.length,
                        (index) => Padding(
                          padding: const EdgeInsetsDirectional.only(end: 3),
                          child: CircleAvatar(
                            radius: index == currentIndex ? 6 : 4,
                            backgroundColor: index == currentIndex
                                ? Theme.of(context).primaryColor
                                : const Color(0xff61B80C),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Failed");
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CategoriesCubit, CategoriesStates>(
            builder: (context, state) {
              if (state is GetCategoryIsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetCategorySuccessState) {
                return SizedBox(
                  height: 139,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "الأقسام",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) =>
                              _ItemCategory(model: state.list[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(
                            width: 16,
                          ),
                          itemCount: state.list.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Text("Failed");
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsSuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "الأصناف",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 163 / 250,
                        ),
                        itemBuilder: (context, index) => _ItemProduct(
                          model: state.list[index],
                        ),
                        itemCount: state.list.length,
                      ),
                    ],
                  ),
                );
              } else {
                return const Text(
                  "Failed",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ItemCategory extends StatelessWidget {
  final CategoryModel model;

  const _ItemCategory({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      child: Column(
        children: [
          Container(
            height: 73,
            width: 73,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppImage(model.media),
          ),
          Text(
            model.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final ProductModel model;

  const _ItemProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(11),
                child: AppImage(
                  model.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(11),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 1),
                    child: Text(
                      "${model.discount}%",
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          model.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          "السعر / 1${model.unit.name}",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text.rich(
          TextSpan(
            text: "${model.price} ر.س",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            children: [
              TextSpan(
                text: " ${model.priceBeforeDiscount} ر.س",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        SizedBox(
          height: 30,
          width: 115,
          child: AppButton(
            text: "أضف للسلة",
            onPress: () {},
          ),
        ),
      ],
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 21,
              width: 21,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "التوصيل إلى\n",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                  ),
                  children: [
                    TextSpan(
                        text: "شارع الملك فهد - جدة",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                CacheHelper.clear();
                toGetNavigate(
                  const LoginView(),
                );
              },
              child: Badge(
                backgroundColor: Theme.of(context).primaryColor,
                label: const Text(
                  "3",
                  style: TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  width: 32,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xff4C8613).withOpacity(.13),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/svg/cart.svg",
                      width: 17,
                      height: 19,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
