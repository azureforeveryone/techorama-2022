// app/palindrome.js

exports.isPalindrome = function(word) {
    var len = word.length; // 7
    var mid = Math.floor(len/2); // 3
    // rac e car

    for ( var i = 1; i < mid; i++) {
        if (word[i - 1] !== word[len - i]) {
            return false;
        }
    }

    return true;
};
