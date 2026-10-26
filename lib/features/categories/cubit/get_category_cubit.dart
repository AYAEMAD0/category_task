import 'package:bloc/bloc.dart';
import 'package:category/features/categories/model/get_category_model.dart';
import 'package:category/network/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../network/api_const.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit() : super(GetCategoryInitial());

  GetCategoryModel getCategoryModel = GetCategoryModel();
  void getCategory() async {
    emit(GetCategoryLoading());
    try {
      final result = await DioHelper().getData(ApiConst.getCategory);
      if (result.statusCode== 200) {
        getCategoryModel=GetCategoryModel.fromJson(result.data);
        emit(GetCategorySuccess());
      } else {
        emit(GetCategoryError());
      }
    } catch (e) {
      emit(GetCategoryError());
    }
  }
}
