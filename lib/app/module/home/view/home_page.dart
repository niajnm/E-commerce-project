import 'package:e_commerce/app/module/home/controller/home_view_model.dart';
import 'package:e_commerce/app/module/home/widget/BottomBarNotch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  bool userInfoCalled = false;
  // api call for user info
  _loadUserInfo(context) async {
    var products =
        await Provider.of<HomeViewModel>(context, listen: false).productData();
  }

  @override
  Widget build(BuildContext context) {
    _loadUserInfo(context);

    //### View Model Initialiezation

    //final List<Map> menuItems = context.menuList();
    //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return Scaffold(
        bottomNavigationBar: const BottomBarNotch(),
        appBar: AppBar(),
        body: WillPopScope(
          onWillPop: () async {
            return _shouldWillPop(context);
          },

          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: (1.6 / 1.2),
                    shrinkWrap: true,
                    children: List.generate(
                      4,
                      (index) {
                        return Container(
                          color: Colors.amber,
                        );
                      },
                    ),
                  ),
                ),
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
        title: Text(
          'Confirm exit',
        ),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'No',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text('Yes'),
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
