// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$APIService on _APIService, Store {
  late final _$getImagesAtom =
      Atom(name: '_APIService.getImages', context: context);

  @override
  ObservableFuture<List<Images>>? get getImages {
    _$getImagesAtom.reportRead();
    return super.getImages;
  }

  @override
  set getImages(ObservableFuture<List<Images>>? value) {
    _$getImagesAtom.reportWrite(value, super.getImages, () {
      super.getImages = value;
    });
  }

  late final _$fetchImagesAsyncAction =
      AsyncAction('_APIService.fetchImages', context: context);

  @override
  Future<List<Images>> fetchImages() {
    return _$fetchImagesAsyncAction.run(() => super.fetchImages());
  }

  @override
  String toString() {
    return '''
getImages: ${getImages}
    ''';
  }
}
