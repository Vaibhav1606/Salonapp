class Repository
{
  static String BaseUrl ="http://10.0.2.2:8082/api";
  static String createuser =BaseUrl+'/create';
  static String getAll =BaseUrl +'/users';
  static String getOne =BaseUrl+'/user';
  static String update =BaseUrl+'/user';
  static String delete =BaseUrl+'/user';
  static String updatefav =BaseUrl+'/user/fav';
  static String removefav =BaseUrl+'/user/fav/remove';
  static String createshop =BaseUrl+'/shop';
}