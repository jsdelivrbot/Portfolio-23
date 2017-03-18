
function palindrome(str) {
  
  var regx = /[\W_]/g;
  var lowercaseString = str.toLowerCase().replace(regx, '');
  var reversedString = lowercaseString.split('').reverse('').join('');
  return reversedString === lowercaseString;
}



palindrome("race car");
