class UserData{
   final String _email;
   final String _name;
   final String _photoUrl;
   final String _uid;

   UserData({ String email, String name, String uid, String photoUrl}) : _email=email, _name=name, _photoUrl=photoUrl, _uid=uid ;

   String get email    => _email; 
   String get name     => _name; 
   String get uid      => _uid; 
   String get photoUrl => _photoUrl; 

}