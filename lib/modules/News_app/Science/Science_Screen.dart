

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappui/layout/news_Layout/cubit.dart';

import '../../../layout/news_Layout/state.dart';
import '../../../sheard/components/components.dart';
class ScienceScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    List artical=cubitNews.get(context).listOfScience;
    return BlocConsumer<cubitNews,stateNews>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: state is! getDataScienceLoding,
          builder: (BuildContext context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return BulderArticalItem(artical[index]);
                },
                separatorBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 3,
                      color: Colors.grey,
                    ),
                  );
                },
                itemCount:artical.length);
          },
          fallback: (BuildContext context) { return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepOrange,
            ),
          ); },

        );
      },
    );
  }

}