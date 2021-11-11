class UserInformation {
  String username;
  String profile_url;
  String post_url;
  String topic;
  int likes_num;

  UserInformation({required this.username, this.profile_url = '', this.post_url = '', this.topic = '', this.likes_num = 0});
}