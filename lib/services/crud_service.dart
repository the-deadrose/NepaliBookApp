import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../api.dart';
import '../models/product.dart';


final products = FutureProvider((ref) => CrudService.getProducts());

class CrudService {
  static final dio = Dio();


  static Future<List<Product>> getProducts() async {
    try {
      final response =  await dio.get(
        Api.baseUrl,
      );
      final data = (response.data as List).map((e) => Product.fromJson(e)).toList();
      return data;
    } on DioError catch (err) {
      throw err.message;
    }
  }


  static Future<Either<String, bool>> addProduct(
      {required String title,
        required String detail,
        required String token,
        required int price,
        required XFile image}) async {
    try {
      try {
        final cloudinary =
        CloudinaryPublic('dx5eyrlaf', 'sample_pics', cache: false);
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );
        await dio.post(Api.addProduct,
            data: {
              'product_name': title,
              'product_detail': detail,
              'price': price,
              'imageUrl': response.secureUrl,
              'public_id': response.publicId
            },
            options: Options(
                headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      } on CloudinaryException catch (e) {
        print(e.message);
      }
      return Right(true);
    } on DioError catch (err) {
      return Left(err.message);
    }
  }

  static Future<Either<String, bool>> updatePost({
    required String title,
    required String detail,
    required int price,
    required String postId,
    required XFile? image,
    required String? imageId,
    required String token,
  }) async {
    try {
      if (image == null) {
        await dio.patch('${Api.updateProduct}/${postId}', data: {
          'photo': 'no need',
          'product_name': title,
          'product_detail': detail,
          'price': price,
        }, options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      } else {
        final cloudinary = CloudinaryPublic('dx5eyrlaf', 'sample_pics', cache: false);
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );
        await dio.patch('${Api.updateProduct}/${postId}',
            data: {
              'product_name': title,
              'product_detail': detail,
              'price': price,
              'public_id': response.publicId,
              'oldImageId': imageId,
              'photo': response.secureUrl
            },
            options: Options(
                headers: {HttpHeaders.authorizationHeader: 'Bearer $token'})
        );
      }
      return Right(true);
    } on DioError catch (err) {
      return Left(err.message);
    }
  }

  static Future<Either<String, bool>> deletePost(
      {required String postId,
        required String imageId,
        required String token
      }) async {
    try {
      await dio.delete('${Api.removeProduct}/$postId',
          data: {
            'public_id': imageId,
          },
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));

      return Right(true);
    } on DioError catch (err) {
      return Left(err.message);
    }
  }
}