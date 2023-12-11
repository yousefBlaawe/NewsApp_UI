import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappui/layout/news_Layout/state.dart';
import 'package:newsappui/sheard/network/local/cach_helper.dart';
import 'package:newsappui/sheard/network/remode/dio_helper.dart';

import '../../modules/News_app/Busniess/business_screen.dart';
import '../../modules/News_app/Science/Science_Screen.dart';
import '../../modules/News_app/Settings/Settings_Screen.dart';
import '../../modules/News_app/Sports/Sports_screen.dart';


class cubitNews extends Cubit<stateNews>
{
  int counter=0;
  List<Widget> listOfSecreens=[
    BusniessScreen(),
    ScienceScreen(),
    SportScreen(),
    settingsScreen(),
  ];
  List<dynamic> listOfBisness=[];
  List<dynamic> listOfScience=[];
  List<dynamic> listOfSports=[];
  List<dynamic> listOfSearchDate=[];
  bool mood=false;
  cubitNews(): super(initailState());
  static cubitNews get(context)
  {
    return BlocProvider.of(context);
  }

  void ButtomNavChaing (val)
  {
    counter=val;
    if(val==0)
      getBisnessData();
    else
    if(val==1)
      getScienceData();
    else
    if(val==2)
      getSportsData();
    emit(navParState());
  }
  void getBisnessData()
  {
    emit(getDataBisnessLoding());
    dioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'us',
          'category':'business',
          'apiKey':'1023309fc9274142b30cfa8af9a13e27',
        } ).then((value) {
      print(value?.data['articles']);
      listOfBisness=value.data['articles'];
      print(listOfBisness[0]['title']);
      emit(getDataBisnessSucces());

    }).catchError((error){
      print('error${error.toString()}');
      emit(getDataBisnessError(error.toString()));}) ;
  }
  void getSearchData(String val)
  {
    emit(getDataSearchLoding());
    dioHelper.getData(
        url: 'v2/everything',
        query:{
          'q':'$val',
          'apiKey':'1023309fc9274142b30cfa8af9a13e27',
        } ).then((value) {
      print(value?.data['articles']);
      listOfSearchDate=value.data['articles'];
      print(listOfSearchDate[0]['title']);
      emit(getDataSearchSucces());

    }).catchError((error){
      print('error${error.toString()}');
      emit(getDataSearchError(error.toString()));}) ;
  }
  void getSportsData()
  {
    emit(getDataSportsLoding());
    dioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'us',
          'category':'sports',
          'apiKey':'1023309fc9274142b30cfa8af9a13e27',
        } ).then((value) {
      print(value?.data['articles']);
      listOfSports=value.data['articles'];
      print(listOfSports[0]['title']);
      emit(getDataSportsSucces());

    }).catchError((error){
      print('error${error.toString()}');
      emit(getDataSportsError(error.toString()));}) ;
  }
  void getScienceData()
  {
    emit(getDataScienceLoding());
    dioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'us',
          'category':'science',
          'apiKey':'1023309fc9274142b30cfa8af9a13e27',
        } ).then((value) {
      print(value?.data['articles']);
      listOfScience=value.data['articles'];
      print(listOfScience[0]['title']);
      emit(getDataScienecSucces());

    }).catchError((error){
      print('error${error.toString()}');
      emit(getDataScienceError(error.toString()));}) ;
  }
  void changemode({bool? fromShared})
  {
    if(fromShared !=null)
    {
      mood =fromShared;
      emit(changeMoodState());
    }
    else
    {  mood=!mood;
    print(mood);
    cachHelper.putData(key: 'isdark', val: mood).then((value) {
      emit(changeMoodState());
    });
    }

  }

}