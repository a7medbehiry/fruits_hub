abstract class DataBaseService {
  Future<void> addUserData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> checkIsDataExist(
      {required String path, required String documentId});
}
