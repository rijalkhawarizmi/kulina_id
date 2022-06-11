import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kulina_id/cubit/fetch_data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kulina_id/model.dart';

class Home extends StatelessWidget {
  DataModel? dataModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchDataCubit>(context).fetchData();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.0), // here the desired height
          child: Container(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            color: Colors.green[500],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.food_bank_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Food ID',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'Dikirim ke '),
                      TextSpan(
                          text: 'Jakarta Selatan',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ])),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  inputFormatters: [],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
                    hintText: 'Mau belanja makanan apa?',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              BlocBuilder<FetchDataCubit, FetchDataState>(
                builder: (context, state) {
                  if (state is FetchDataLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FetchDataSuccess) {
                    dataModel = state.dataModel;
                  } else if (state is FetchDataFailed) {
                    return Center(
                      child: Text(state.messageError),
                    );
                  }
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: dataModel?.data?.skip(1).skip(2).map((data) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 600,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: data.variant?.name == 'Top'
                                ? BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage('${data.media}'),
                                        fit: BoxFit.cover))
                                : BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Text(
                                  '${data.name}',
                                  style: const TextStyle(
                                      fontSize: 20.0, color: Colors.red),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
