/**
 * This file is part of the 1st Solidity Gas Golfing Contest.
 *
 * This work is licensed under Creative Commons Attribution ShareAlike 3.0.
 * https://creativecommons.org/licenses/by-sa/3.0/
 */

pragma solidity 0.4.24;

contract IndexOf {
    /*
     * @dev Returns the index of the first occurrence of `needle` in `haystack`,
     *      or -1 if `needle` is not found in `haystack`.
     *
     * Input strings may be of any length <2^255.
     *
     * @param haystack The string to search.
     * @param needle The string to search for.
     * @return The index of `needle` in `haystack`, or -1 if not found.
     */

     // Total Gas Used: 1170817

    function indexOf(string haystack, string needle) public pure returns(int) {
        int potentialNeedle;
        bytes memory string_rep2 = bytes(needle);
        if(string_rep2.length == 0 || int(bytes(haystack).length) == 0 || (int(string_rep2.length) > int(bytes(haystack).length))) { return -1; }
        bytes memory result = new bytes(string_rep2.length);
        for(int y = 0; y < int(bytes(haystack).length); y++) {
            if (bytes(haystack)[uint(y)] == string_rep2[0]) {
                result[0] = bytes(haystack)[uint(y)];
                potentialNeedle = y;
                if(bytes(haystack)[uint(potentialNeedle) + string_rep2.length - 1] == string_rep2[uint(bytes(haystack).length) - 1]) {
                    result[string_rep2.length - 1] = bytes(haystack)[uint(potentialNeedle) + string_rep2.length - 1];
                    for(int z = potentialNeedle + 1; z < (int(string_rep2.length) - 1); z++) {
                        result[uint(z - potentialNeedle)] = bytes(haystack)[uint(z)];
                    }
                }
            }
            if(keccak256(result) == keccak256(string_rep2)) { return potentialNeedle; }
        }
        return -1;

}
}
