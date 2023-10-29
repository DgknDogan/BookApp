part of 'book_cubit.dart';

@immutable
class BookState {
  final bool isProductLoaded;
  final bool isCategoryLoaded;
  final bool isCoversLoaded;
  final List<Category> bookCategoriesList;
  final List<Category> filteredBookCategoriesList;
  final Map<String, ResponseModel<List<Product>>> productsList;
  final List<Product> filteredProductsList;
  final Map<String, ResponseModel<String>> bookCoverUrls;
  final String? fetchCategoriesErrorMessage;

  const BookState(
      {required this.isProductLoaded,
      required this.isCategoryLoaded,
      required this.isCoversLoaded,
      required this.bookCategoriesList,
      required this.filteredProductsList,
      required this.filteredBookCategoriesList,
      required this.productsList,
      required this.bookCoverUrls,
      this.fetchCategoriesErrorMessage});

  BookState copyWith({
    List<Category>? bookCategoriesList,
    List<Category>? filteredBookCategoriesList,
    Map<String, ResponseModel<List<Product>>>? productsList,
    List<Product>? filteredProductsList,
    Map<String, ResponseModel<String>>? bookCoverUrls,
    bool? isProductLoaded,
    bool? isCategoryLoaded,
    bool? isCoversLoaded,
    String? fetchCategoriesErrorMessage,
  }) {
    return BookState(
      bookCategoriesList: bookCategoriesList ?? this.bookCategoriesList,
      filteredBookCategoriesList:
          filteredBookCategoriesList ?? this.filteredBookCategoriesList,
      productsList: productsList ?? this.productsList,
      filteredProductsList: filteredProductsList ?? this.filteredProductsList,
      bookCoverUrls: bookCoverUrls ?? this.bookCoverUrls,
      isCategoryLoaded: isCategoryLoaded ?? this.isCategoryLoaded,
      isProductLoaded: isProductLoaded ?? this.isProductLoaded,
      isCoversLoaded: isCoversLoaded ?? this.isCoversLoaded,
      fetchCategoriesErrorMessage:
          fetchCategoriesErrorMessage ?? this.fetchCategoriesErrorMessage,
    );
  }

  bool get isLoading => isProductLoaded && isCategoryLoaded && isCoversLoaded;
}
