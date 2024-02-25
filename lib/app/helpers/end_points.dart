class EndPoints {
  static const base = 'https://soon.estamerapp.com';
  static const baseUrl = '$base/api/';

  /// Post
  static const signIn = 'login';
  static const logout = 'user/logout';
  static const deleteUser = 'user/delete';
  static const signUp = 'register';
  static const forgotPassword = 'password/forgot';
  static const resetPassword = 'password/reset';
  static const tokenVerify = 'token/verify';
  static const contactUs = 'message/send';

  /// * Get

  static const user = 'user';
  static const cities = 'cities';
  static const partners = 'partners';
  static const openPost = 'posts/:id';
  static const postsSoon = 'posts/soon';
  static const postsLaunched = 'posts/launched';
  static const cityPosts = 'cities/:id/posts';
}
