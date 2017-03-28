var playlist = new Playlist();

var keepMe = new Song("Keep Me", "The Black Keys", "2:51");
var hardRow = new Song("Hard Row", "The Black Keys", "3:14");
var ickyThump = new Song("Icky Thump", "The White Stripes", "4:19");
var fellInLoveWithAGirl = new Song("Fell in Love with a Girl", "The White Stripes", "1:56");
var deadLeavesAndTheDirtyGround = new Song("Dead Leaves and the Dirty Ground", "The White Stripes", "3:03");
var hardestButtonToButton = new Song("Hardest Button to Button", "The White Stripes", "3:33");
var blueOrchid = new Song("Blue Orchid", "The White Stripes", "2:44");

var manOfSteel = new Movie("Man of Steel", 2013, "2:23:03");


playlist.add(keepMe);
playlist.add(hardRow);
playlist.add(ickyThump);
playlist.add(fellInLoveWithAGirl);
playlist.add(deadLeavesAndTheDirtyGround);
playlist.add(hardestButtonToButton);
playlist.add(blueOrchid);

playlist.add(manOfSteel);

var playlistElement = document.getElementById("playlist");

playlist.renderInElement(playlistElement);

var playButton = document.getElementById("play");
playButton.onclick = function() {
  playlist.play();
  playlist.renderInElement(playlistElement);
}
var nextButton = document.getElementById("next");
nextButton.onclick = function() {
  playlist.next();
  playlist.renderInElement(playlistElement);
}
var stopButton = document.getElementById("stop");
stopButton.onclick = function() {
  playlist.stop();
  playlist.renderInElement(playlistElement);
}
