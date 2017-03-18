function reverseString(str) {
  var splitString = str.split("");
  var reverseArray = splitString.reverse("");
  var reverseWord = reverseArray.join("");
  return reverseWord;
}

reverseString("hello");
