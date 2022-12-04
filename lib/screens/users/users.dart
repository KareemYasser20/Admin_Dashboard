// ignore_for_file: avoid_print

import 'package:admin_dashboard/models/user_model.dart';
import 'package:admin_dashboard/screens/users/users_data.dart';
import 'package:admin_dashboard/screens/users/add_users_screen.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/components/progress.dart';
import 'package:admin_dashboard/shared/provider/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

List<SingleUser> users = [];

class UsersScreen extends StatefulWidget {
  static const String id = 'users_screen';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late ScrollController myScroll;
  int i = 0;
  late List userArray;
  late GlobalKey<RefreshIndicatorState> refreshKey;
  bool loadingList = false;

  void getUserData(
      int count, String searchText) async {
    loadingList = true;
    setState(() {
      
    });
    // my Provid.addLoading();
    userArray = (await getUsersData(count, searchText))!;
    print('hii --> ${userArray.length}');

    for (int i = 0; i < userArray.length; i++) {
      users.add(SingleUser(
        user: UserModel.fromJson(userArray[i]), onTapFunction: () {  }, cancelFunction: () {  },
      ));
      print('users --> $users');
    }

    loadingList = false;
    setState(() {
      
    });
    // myProvid.addLoading();
  }

  @override
  void initState() {
    super.initState();
    myScroll = ScrollController();
    refreshKey =  GlobalKey<RefreshIndicatorState>();
    users.clear();
    getUserData(0, "");

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 10;
        getUserData(i, "");
        print("scroll");
      }
    });
  }

  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Users');

  void _searchPressed(LoadingControl provider) {
    if (_searchIcon.icon == Icons.search) {
      _searchIcon = const Icon(Icons.close);
      _appBarTitle = TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
        ),
        onChanged: (value) {
          users.clear();
          i = 0;
          getUserData(0, value );
          provider.addLoading();
          print(value);
        },
      );
    } else {
     _searchIcon = const Icon(Icons.search);
    _appBarTitle = const Text('Search for user');
    }
    provider.addLoading();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<LoadingControl>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: _appBarTitle,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _searchPressed(myProvider);
              },
              child: _searchIcon,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          i = 0;
          userArray.clear();
          //await
          getUserData(0, "");
        },
        key: refreshKey,
        child: Stack(
          children: [
            ListView.builder(
              controller: myScroll,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return  SingleUser(
                    user: users[index].user,
                    cancelFunction: () {
                      users.removeAt(index);
                      myProvider.addLoading();
                    },
                    onTapFunction: () {
                      // Navigator.pushNamed(context, EditUser.id,
                      //     arguments: EditCategory(
                      //       categoryProduct: categoryProduct[index],
                      //     ));

                    },
                  
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 2,
              child: loadingList ? circularProgress() : const Text(""),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: GestureDetector(
                child: const Text(
                  "Add New User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AddUser.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleUser extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTapFunction;
  final VoidCallback cancelFunction;

  const SingleUser({Key ? key, required this.user,required this.onTapFunction, required this.cancelFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: cancelFunction,
            child: Container(
              alignment: Alignment.topLeft,
              child: const Icon(
                Icons.cancel,
                color: primaryColor,
                size: 30.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              user.userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.userEmail,
                  style: const TextStyle(),
                ),
                Text(user.userLastdate),
              ],
            ),
            // leading: Container(
            //   width: 50.0,
            //   child: Text(user.userLastdate),
            //   // decoration: BoxDecoration(

            //   //   image: DecorationImage(
            //   //     image: AssetImage(product.productImage),
            //   //     fit: BoxFit.cover,
            //   //   ),
            //   //   shape: BoxShape.circle,
            //   // ),
            // ),
            trailing: SizedBox(
              width: 32.0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTapFunction,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
