import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/admin/admin_home/views/screens/pending_seller_screen.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit() : super(AdminHomeInitial());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  closeDrawer(BuildContext context){
    scaffoldKey.currentState?.closeDrawer();
  }

  onPendingSellerRequestClick(BuildContext context){
    _navigateToPendingSellerRequest(context);
  }

  _navigateToPendingSellerRequest(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> PendingSellerScreen()));
  }

}
