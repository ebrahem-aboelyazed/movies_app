import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  final PageController pageController = PageController();

  int? get currentPage => pageController.page?.toInt();

  void changePage({required int page}) {
    if (currentPage != page) {
      pageController.jumpToPage(page);
    }
  }

  @override
  void emit(HomeState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
