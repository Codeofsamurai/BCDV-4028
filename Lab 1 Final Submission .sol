// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SortAndDeleteDuplicateLibrary {
    // This Function is to sort an array of integers using bubble sort, this sorts the array in ascending order.
    function bubbleSort(uint[] storage arr) internal view returns (uint[] memory) {
        uint[] memory sortedArr = new uint[](arr.length);
        for (uint i = 0; i < arr.length; i++) {
            sortedArr[i] = arr[i];
        }
       
        if (sortedArr.length <= 1) {
            return sortedArr;
        }
       
        // Here, a simple bubble sort algorithm is used
        for (uint i = 0; i < sortedArr.length - 1; i++) {
            for (uint j = 0; j < sortedArr.length - i - 1; j++) {
                if (sortedArr[j] > sortedArr[j + 1]) {
                    (sortedArr[j], sortedArr[j + 1]) = (sortedArr[j + 1], sortedArr[j]); // Swap elements
                }
            }
        }
       
        return sortedArr;
    }

    // We introduce here a Function, in order to remove duplicates from an array of integers
    function removeDuplicates(uint[] storage arr) internal view returns (uint[] memory) {
        if (arr.length <= 1) {
            return arr;
        }

        uint[] memory uniqueArr = new uint[](arr.length);
        uint uniqueArrLength = 0;
       
        for (uint i = 0; i < arr.length; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < uniqueArrLength; j++) {
                if (uniqueArr[j] == arr[i]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                uniqueArr[uniqueArrLength] = arr[i];
                uniqueArrLength++;
            }
        }
       
        // Then we Copy the unique values, and put them into a new array
        uint[] memory result = new uint[](uniqueArrLength);
        for (uint i = 0; i < uniqueArrLength; i++) {
            result[i] = uniqueArr[i];
        }
       
        return result;
    }
}

contract ArraySorting {
    using SortAndDeleteDuplicateLibrary for uint[];

    uint[] public data;

    function addData(uint _value) public {
        data.push(_value);
    }

    function sortArray() public {
        data = data.bubbleSort();
    }

    function removeDuplicates() public {
        data = data.removeDuplicates();
    }
}
