/**
 * This file is part of the 1st Solidity Gas Golfing Contest.
 *
 * This work is licensed under Creative Commons Attribution ShareAlike 3.0.
 * https://creativecommons.org/licenses/by-sa/3.0/
 */

pragma solidity ^0.4.24;

contract Unique {
    /**
     * @dev Removes all but the first occurrence of each element from a list of
     *      integers, preserving the order of original elements, and returns the list.
     *
     * The input list may be of any length.
     *
     * @param input The list of integers to uniquify.
     * @return The input list, with any duplicate elements removed.
     */

     //Total gas for Unique: 957787

    function uniquify(uint[] input) public pure returns(uint[] ret) {
      if(input.length < 2) {
         return input;
     }

     uint[256][2] memory hashTable;
     uint[] memory index = new uint[](input.length);
     uint counter;
     bool nullValue;

     for(uint i = 0; i < input.length; i++) {
         uint hash = input[i] &255;

         if(hashTable[0][hash]==0 && input[i] != 0) {
             hashTable[0][hash] = input[i];
             index[counter] = input[i];
             counter++;
         }
         else if(hashTable[0][hash]!=0 && input[i]!=hashTable[0][hash]) {
             hashTable[1][hash] = input[i];
             index[counter] = input[i];
             counter++;
         }
         else if(!nullValue && input[i] == 0){
             nullValue = true;
             hashTable[0][hash] = 0;
             index[counter] = 0;
             counter++;
         }
     }

     ret = new uint[](counter);
     for(i=0; i < counter; i++) {
         ret[i] = index[i];
     }
   }
 }
