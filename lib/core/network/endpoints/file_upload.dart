abstract class FileUploadEndpoint {
  static const fileUpload = 'user/files/upload';
  static const documentUpload = 'user/document/upload';
  static const getDocumentVault = 'user/document/documents';
  static const getAllHouses = 'user/doorbell';
  static const getAddress = 'app/get-address';
  static const createHouse = 'user/doorbell';
  static String getSearchSuggestions({required String query}) {
    return 'search/suggestions?query=${Uri.encodeComponent(query)}'; 
  }
}
