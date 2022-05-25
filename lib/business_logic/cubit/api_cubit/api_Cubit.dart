import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/model/model.dart';
import 'package:MDKDelivery/service/api.dart';

import 'api_states.dart';

class NewsAppCubit extends Cubit<ApiStates> {
  NewsAppCubit() : super(InitApiappState());
  static NewsAppCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];
  List<Model> bssn = [];
  void getBusiness() {
    print("business Func  is caled");

    emit(NewsBusinessLoadingState());

    Helper.getData(
      Helper.path,
      Helper.query,
    ).then((value) {
      business = value.data['articles'];
      bssn = business.map((e) => Model.fromJson(e)).toList();
      print("business data is here$bssn");

      emit(GetBusinessDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetBusinessDataErorrState(e.toString()));
    });
  }

  static String searchPath = "v2/everything";

  List<dynamic> searchList = [];
  void search(String value) {
    emit(ApiSearchLoadingState());
    Helper.getData(searchPath, {'q': value, 'apiKey': Helper.apiKey})
        .then((value) {
      searchList = value.data['articles'];

      emit(GetSearcheDataSuccessState());
    }).catchError((e) {
      emit(GetSearchDataErorrState(e.toString()));
    });
  }
}
