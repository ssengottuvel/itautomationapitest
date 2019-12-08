function() {   
  var config = {
    apiURL: 'http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3'
  };
  
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}