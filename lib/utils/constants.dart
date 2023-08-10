class Constants{
  static String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  static String healinesFor(String kw){
    return "https://newsapi.org/v2/everything?q="+"$kw"+"&from=2023-08-08&sortBy=popularity&apiKey=";
  }
}