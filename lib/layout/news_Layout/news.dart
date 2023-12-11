import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappui/layout/news_Layout/state.dart';

import '../../modules/News_app/Search/search_Screen.dart';
import '../../sheard/components/components.dart';
import 'cubit.dart';


class newsLayout extends StatelessWidget
{
  static  var  mood=ThemeMode.light;
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<cubitNews,stateNews>(

      listener: (context,state){},
      builder: (context,state){


        return Scaffold(

          appBar:  AppBar(
            title: Text(
              'NEWS APP',

            ),
            actions: [
              IconButton(onPressed: ()
              {

                navegatorTo(context, searchScreen());
              },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    cubitNews.get(context).changemode();
                  },
                  icon: Icon(Icons.shield_moon_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubitNews.get(context).counter,
            onTap:(val)
            {
              cubitNews.get(context).ButtomNavChaing(val);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'BUSINESS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                label: 'SCIENCE',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'SPORTS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'SETTINGE',
              ),
            ],
          ),
          body: cubitNews.get(context).listOfSecreens[cubitNews.get(context).counter],
        );
      },
    );
  }

}