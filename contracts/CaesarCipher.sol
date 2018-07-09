pragma solidity ^0.4.24;

contract CaesarCipher {
  //Total Gas Used: 1309990

  bytes alphabet = 'abcdefghijklmnopqrstuvwxyz';
  bytes encryptedStr = '';

  function cipher(string _str, uint _rotateFactor) public returns (string){

    bytes memory str = bytes(_str);
    for(uint i = 0; i < str.length; i++) {
      for(uint j = 0; j < alphabet.length; j++) {
        if(str[i] == alphabet[j]) {
          if(j + _rotateFactor > 25) {
            encryptedStr.push(alphabet[(j + _rotateFactor) % 26]);
          } else {
            encryptedStr.push(alphabet[j + _rotateFactor]);
          }
        }
      }
    }
    return string(encryptedStr);
  }
}
