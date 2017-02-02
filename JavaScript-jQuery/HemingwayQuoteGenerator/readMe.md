### Hemingway Quote Generator

http://codepen.io/templenaylor/full/NdvbaP/

I believe Hemingway was one of the all time greatest writers to walk this planet. His thought process was heavy, yet elegant, easily
giving him one of the most unique styles to date. I built this Random Quote Generator as a tribute to his writing. Enjoy.

### Impediments

The biggest issue with this project was trying to get the tweeting button to function properly. Being exhilarated that I got the twitter button to tweet in a new window properly, I hadn't realized that it was not tweeting properly. This is what I had previously:

$(".twitter-share-button").click(function(){
    $(this).attr("href", 'https://twitter.com/intent/tweet?text=' + randomNumber);
  });

function tweetIt(){
var randomNumber = Math.floor(Math.random() * (quotes.length));
window.open("https://twitter.com/intent/tweet?text=" + quotes[randomNumber]);
}

This was grabbing a whole new random quote from the array and not the current quote provided. Quickly realizing that I was storing my quote from my randomQuote function in a ID with 'Quote Display', I targeted it with a innerText property. Lastly I learned that firefox does not support this property, so I changed it to textContent. 
Here is the final working function:

function tweetIt(){
  // Get the contents of your current tweet
  var tweet = document.getElementById('quoteDisplay').textContent;
  // Open a new window with that tweet content
  window.open("https://twitter.com/intent/tweet?text=" + tweet);
};

Return to [portfolio](../../../../)
