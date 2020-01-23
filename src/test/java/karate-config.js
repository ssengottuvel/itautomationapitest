function() {   
  var config = {
    apiURL: 'http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3'
  };
  
  karate.configure('connectTimeout', 20000);
  karate.configure('readTimeout', 20000);
  return config;
}