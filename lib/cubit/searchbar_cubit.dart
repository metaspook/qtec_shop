import 'package:bloc/bloc.dart';

class SearchbarCubit extends Cubit<String> {
  SearchbarCubit() : super("");

  void setQuery(String query) => emit(query);
  // String getQuery() => emit(state);
}
