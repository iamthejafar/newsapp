class Constants{
  static String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=292d89acfdbd4a8fad28ee67c6d2fdee';

  static String healinesFor(String kw){
    return "https://newsapi.org/v2/everything?q="+"$kw"+"&from=2023-08-08&sortBy=popularity&apiKey=292d89acfdbd4a8fad28ee67c6d2fdee";
  }
}