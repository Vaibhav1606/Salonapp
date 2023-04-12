class Repository
{
  static String BaseUrl ="http://10.0.2.2:9090/api";
  static String createuser =BaseUrl+'/user';
  static String getAll =BaseUrl +'/users';
  static String getOne =BaseUrl+'/user';
  static String update =BaseUrl+'/user';
  static String delete =BaseUrl+'/user';
  static String updatefav =BaseUrl+'/user/fav';
  static String removefav =BaseUrl+'/user/fav/remove';
  static String createshop =BaseUrl+'/shop';
  static String getAllShop =BaseUrl+'/shops';
}