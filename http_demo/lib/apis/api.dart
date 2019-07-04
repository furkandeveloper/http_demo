// as anahtar kelimesi ; http paketini kullanmak isteyen birisi bunu http ismi ile kullanabilsin
import 'package:http/http.dart' as http;
class Api {
  static Future getTodos(){
    return http.get("https://jsonplaceholder.typicode.com/todos");
  }
}