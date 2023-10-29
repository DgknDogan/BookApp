import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookapp/Features/Book/BooksRepository/books_repository.dart';
import 'package:bookapp/Features/Book/BooksRepository/response.dart';
import 'package:bookapp/Features/Book/Models/product_model.dart';
import 'package:bookapp/Features/Book/Models/category_model.dart';
import 'package:meta/meta.dart';
part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit()
      : super(
          const BookState(
            bookCategoriesList: [],
            filteredBookCategoriesList: [],
            productsList: {},
            filteredProductsList: [],
            bookCoverUrls: {},
            isCategoryLoaded: false,
            isProductLoaded: false,
            isCoversLoaded: false,
          ),
        ) {
    getCategories();
    getProducts();
    getBookCovers();
  }

  final BooksRepositery _booksRepository = BooksRepositery();

  Future<void> getCategories() async {
    final result = await _booksRepository.categoryRequest();

    emit(state.copyWith(
        bookCategoriesList: result.hasError ? [] : result.model,
        isCategoryLoaded: true,
        fetchCategoriesErrorMessage: result.errorMessage));
  }

  Future<void> getProducts() async {
    final result = await _booksRepository.productRequest();

    emit(state.copyWith(
      productsList: result,
      isProductLoaded: true,
    ));
  }

  Future<void> getBookCovers() async {
    final result = await _booksRepository.getProductCovers();

    emit(state.copyWith(
      bookCoverUrls: result,
      isCoversLoaded: true,
    ));
  }

  void onCategorySearchbarChanged(String letters) {
    List<Category> tempList = [];
    for (var i = 0; i < state.bookCategoriesList.length; i++) {
      if (state.bookCategoriesList[i].name!
          .toLowerCase()
          .contains(letters.toLowerCase())) {
        tempList.add(state.bookCategoriesList[i]);
      }
    }
    emit(state.copyWith(filteredBookCategoriesList: tempList));
  }

  void onProductSearchbarChanged(String letters, String? categoryName) {
    List<Product> tempList = [];
    if (categoryName != null) {
      for (var i = 0;
          i < state.productsList[categoryName]!.model!.length;
          i++) {
        if (state.productsList[categoryName]!.model![i].name!
            .toLowerCase()
            .contains(letters.toLowerCase())) {
          tempList.add(state.productsList[categoryName]!.model![i]);
        }
      }
    }

    emit(state.copyWith(filteredProductsList: tempList));
  }

  void onCategoryTabBarChanged(int value) {
    List<Category> tempList = [];
    if (value == 0) {
      tempList = state.bookCategoriesList;
    } else {
      tempList.add(state.bookCategoriesList[value - 1]);
    }
    emit(state.copyWith(filteredBookCategoriesList: tempList));
  }
}
