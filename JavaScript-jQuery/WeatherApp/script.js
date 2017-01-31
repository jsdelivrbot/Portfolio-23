$(document).ready(function(){
  
  var lat;
  var long;
  
  // Get lat and long altitude for Open Weather API with geolocation API
  $.getJSON("http://ip-api.com/json", function(data2) {
    lat=data2.lat;
    long=data2.lon;
    
    // Create API URL with geolocation
    var api = 'http://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+long+'&appid=a1c582b799af6a27feddaffc36a5eacf'
  
    // Create JSON request for Open Weather API
    $.getJSON(api, function(data){
      var long;
      var lat; 
      var fTemp;
      var cTemp;
      var tempSwap = true;
      //JSON call for Open Weather API
      var weatherType = data.weather[0].description;
      var kelvin = data.main.temp;
      var windSpeed = data.wind.speed;
      var city = data.name;
      var icon = data.weather[0].icon;
    
      //Temperature in Farenheit
      fTemp = ((kelvin)*(9/5)-459.67).toFixed(1); // Rounding the numbers due to long # string
      //Temp in Celcius 
      cTemp = (kelvin-273).toFixed(1);
    
      // Call data from variables
      $("#city").html(city);
      $("#weatherType").html(weatherType);
      $("#fTemp").html(fTemp + " &#8457;");
      var iconSrc = "http://openweathermap.org/img/w/" + icon + ".png";
      $("#icon").html('<img src="' + iconSrc + '">');
     
      // Switch from Cel. to Far. on click
      $("#fTemp").click(function(){
        if(tempSwap===false){
          $("#fTemp").html(fTemp + " &#8457;");
          tempSwap=true;
        } else{
          $("#fTemp").html(cTemp + " &#8451;");
          tempSwap=false;
        }
      });
    
 
    });
  });
    
    
 
  
});