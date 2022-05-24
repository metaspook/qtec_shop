import 'package:bloc/bloc.dart';

class SearchbarCubit extends Cubit<String> {
  SearchbarCubit() : super('');

  void setQuery(String query) {
    if (state != query) emit(query);
  }
}
