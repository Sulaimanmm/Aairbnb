import 'package:air_bnb/business_logic/explore_screen/explore_screen_bloc.dart';
import 'package:air_bnb/model_class/product_list.dart';
import 'package:air_bnb/support_files/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../support_files/ip_address.dart';

class ExploreScreenAddBloc extends StatefulWidget {
  const ExploreScreenAddBloc({super.key});

  @override
  State<ExploreScreenAddBloc> createState() => _ExploreScreenAddBlocState();
}

class _ExploreScreenAddBlocState extends State<ExploreScreenAddBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreScreenBloc(),
      child: const ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ExploreScreenBloc>(context).add(FetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExploreScreenBloc, ExploreScreenState>(
        builder: (context, state) {
          if (state is ExploreLoading) {
            return const CircularProgressIndicator();
          } else if (state is ExploreLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 310,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              side: const BorderSide(
                                  width: .1, color: Colors.grey),
                              backgroundColor: Colors.white,
                            ),
                            iconAlignment: IconAlignment.start,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 33,
                                  color: textColor,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Where to?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: textColor),
                                    ),
                                    const Text(
                                      'Anywhere.Any week.Any guests',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              color: Colors.white),
                          child: IconButton(
                            color: textColor,
                            onPressed: () {},
                            icon: const Icon(Icons.filter_list),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    DefaultTabController(
                      length: state.productList.data.length,
                      child: Column(
                        children: [
                          TabBar(
                            tabAlignment: TabAlignment.start,
                            labelColor: textColor,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.redAccent,
                            isScrollable: true,
                            tabs: state.productList.data.map((category) {
                              return Tab(
                                height: 60,
                                child: CategoryIcon(
                                  imageUrl:
                                      '$subExploreApi${category.categoryIcon}',
                                  label: category.categoryName,
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .712,
                            child: TabBarView(
                              children: state.productList.data.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1),
                                      itemCount: category.products.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final product =
                                            category.products[index].image;
                                        return Column(
                                          children: [
                                            CarouselSlider.builder(
                                              itemCount: product.length,
                                              itemBuilder: (context, itemIndex,
                                                  realIndex) {
                                                return Container(
                                                  // height: 200,
                                                  width: 500,
                                                  color: Colors.grey,
                                                  child: Card(
                                                    semanticContainer: true,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Image.network(
                                                      '$subExploreApi${product[itemIndex]}',
                                                      fit: BoxFit.fill,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return Image.asset(
                                                          'assets/images/house.png',
                                                          fit: BoxFit.fill,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                              options: CarouselOptions(
//height: 500,
                                                viewportFraction: 1,
                                                enlargeCenterPage: true,
                                                enableInfiniteScroll: false,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    _currentIndex = index;
                                                  });
                                                },
                                              ),
                                            ),
                                            Center(
                                              child: AnimatedSmoothIndicator(
                                                activeIndex: _currentIndex,
                                                count: product.length,
                                                effect: const WormEffect(
                                                  activeDotColor:
                                                      Colors.redAccent,
                                                  dotHeight: 8,
                                                  dotWidth: 8,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ExploreError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String? imageUrl;
  final String label;

  const CategoryIcon({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 35,
          width: 35,
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, StackTrace) {
              return Image.asset('assets/icons/apple_icon.png');
            },
          ),
        ),
        Text(
          textAlign: TextAlign.start,
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

class ListingCard extends StatelessWidget {
  final String? imageUrl;
  final String location;
  final String facilities;
  final String dates;
  final String price;

  const ListingCard(
      {super.key,
      required this.imageUrl,
      required this.location,
      required this.facilities,
      required this.price,
      required this.dates});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl!,
            height: 200,
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.cover,
            errorBuilder: (context, error, StackTrace) {
              return Image.asset(
                'assets/images/house.png',
                height: 200,
                width: MediaQuery.of(context).size.width * 1,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(location,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(facilities,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              Text(dates,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color: textColor,
                    size: 14,
                  ),
                  Text('$price total',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
