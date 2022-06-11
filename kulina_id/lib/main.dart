import 'package:flutter/material.dart';
import 'package:kulina_id/cubit/fetch_data_cubit.dart';
import 'package:kulina_id/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  FetchDataCubit(),
      child: MaterialApp(
          theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
          home:Home()),
    );
  }
}