### Local Weather APP

One of the main challenges I went through building this application was getting the browser to find the local weather for the user. 
This is due to the fact I was using a outdated formula in order to get the current location:

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    $("#data").html("latitude: " + position.coords.latitude + "<br>longitude: " + position.coords.longitude);
  });
}

Chrome and Firefox had realeased an update that prevents browsers from collecting location data if it is not from a https address.
In order to fix this I used a simple API location data which you can find here: http://ip-api.com/json
I then created a JSON call and concatenated it with my "var api" in order to get the correct latitude and longitude for my program.
