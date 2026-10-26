
import 'package:category/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/categories/view/category_view.dart';
import 'features/categories/cubit/get_category_cubit.dart';

void main() {
  DioHelper().initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => GetCategoryCubit()..getCategory(),
        child: const CategoryView(),
      ),
    );
  }
}
