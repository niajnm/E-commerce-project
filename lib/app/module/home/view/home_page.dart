import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';
import 'package:e_commerce/app/module/home/controller/home_view_model.dart';
import 'package:e_commerce/app/module/home/widget/BottomBarNotch.dart';
import 'package:e_commerce/app/module/home/widget/card_product.dart';
import 'package:e_commerce/app/module/home/widget/filter_bar.dart';
import 'package:e_commerce/app/module/home/widget/grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool userInfoCalled = false;

  // api call for user info
  _loadUserInfo(context) async {
    await Provider.of<HomeViewModel>(context, listen: false).productData();
  }

  @override
  void initState() {
    _loadUserInfo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //### View Model Initialiezation

    //final List<Map> menuItems = context.menuList();
    //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return Scaffold(
         bottomNavigationBar: const BottomBarNotch(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Product List',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            return _shouldWillPop(context);
          },

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0).r,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterBar(
                    onFilterTap: () => null,
                    selectedSort: 'Popularity',
                    onSortChange: (value) => null),
                Consumer<HomeViewModel>(builder: (context, viewModel, child) {
                  List<ProductDataModel>? data = viewModel.getProducts;
                  return data != null
                      ? Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ProductItemCard(
                                imageUrl: data[index].imageUrl,
                                title: data[index].name,
                                price: data[index].price,
                                oldPrice: data[index].price,
                                rating: data[index].rating,
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.appBarColor,
                          ),
                        );
                }),
              ],
            ),
          ),
          //),
        ));
  }

  Future<bool> _shouldWillPop(context) async {
    bool confirmExit = await showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text(
          'Confirm exit',
        ),
        content: const Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text(
              'No',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return confirmExit;
  }
}

int isPaymentPageID = 1;
int isStatusPageID = 2;
int isReportPage = 3;
int isComplainPage = 4;
int isPaymentStatusPage = 5;
int isPondSample = 6;
