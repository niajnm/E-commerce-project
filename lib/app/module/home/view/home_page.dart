import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/extention.dart';
import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';
import 'package:e_commerce/app/module/home/controller/home_view_model.dart';
import 'package:e_commerce/app/module/home/widget/card_product.dart';
import 'package:e_commerce/app/module/home/widget/filter_bar.dart';
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

  String selectedSort = 'Newest';

  @override
  void initState() {
    _loadUserInfo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Product List',
            style: context.appThemeText.headlineSmall,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
        ),
        extendBody: true,
        body: WillPopScope(
          onWillPop: () async {
            return _shouldWillPop(context);
          },

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterBar(
                    onFilterTap: () => _showSortBottomSheet(),
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
                              childAspectRatio: 0.6,
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

  void sortProducts(String sortOption) {
    switch (sortOption) {
      case 'Newest':
        // Assuming products are already sorted by newest by default
        break;
      case 'Oldest':
        // Assuming products have a 'created_at' field for sorting by oldest
        // products.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 'Price low > High':
        Provider.of<HomeViewModel>(context, listen: false).sortByPrice(true);
        break;
      case 'Price high > Low':
        Provider.of<HomeViewModel>(context, listen: false).sortByPrice(false);
        break;
      case 'Best selling':
        Provider.of<HomeViewModel>(context, listen: false).sortByRating();
        break;
    }
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        RadioListTile<String>(
                          title: const Text('Newest'),
                          value: 'Newest',
                          groupValue: selectedSort,
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Oldest'),
                          value: 'Oldest',
                          groupValue: selectedSort,
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Price low > High'),
                          value: 'Price low > High',
                          groupValue: selectedSort,
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Price high > Low'),
                          value: 'Price high > Low',
                          groupValue: selectedSort,
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Best selling'),
                          value: 'Best selling',
                          groupValue: selectedSort,
                          onChanged: (value) {
                            setState(() {
                              selectedSort = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sortProducts(selectedSort);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Apply'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

int isPaymentPageID = 1;
int isStatusPageID = 2;
int isReportPage = 3;
int isComplainPage = 4;
int isPaymentStatusPage = 5;
int isPondSample = 6;
