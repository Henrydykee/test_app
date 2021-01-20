
import 'package:flutter/material.dart';
import 'package:test_app/enum/status.dart';
import 'package:test_app/model/model.dart';
import 'package:test_app/viewmodel/user_ViewModel.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widget/busy.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  UserViewModel _userViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if( _userViewModel.getUser() == null ){
        _userViewModel.getListedUsers();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User",style: TextStyle(color: Colors.black)),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Consumer<UserViewModel>(
        builder: (context, vm, child){
          if( vm.getStatus() == Status.LOADING){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _userViewModel.getUser()?.length,
                    itemBuilder: (context, index){
                      //User user =  _userViewModel.getUser()[index];
                      return Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                            ),
                            Column(
                              children: [
                                TextHolder(
                                  title: "${_userViewModel.getUser()[index]?.username}",
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                ),
              )
            ],
          );
        },
      )
    );
  }
}




class TextHolder extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final double size;

  TextHolder({this.title, this.fontWeight, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text("$title",
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: size
      ),);
  }
}
