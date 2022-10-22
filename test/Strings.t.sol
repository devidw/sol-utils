// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Strings.sol";

contract StringsTest is Test {
    using Strings for string;
    string private _str = "abc";

    function testGetCharAtPositivePos() public {
        assertEq(_str.charAt(0), "a");
        assertEq(_str.charAt(1), "b");
        assertEq(_str.charAt(2), "c");
    }

    function testGetCharAtNegativePos() public {
        assertEq(_str.charAt(-1), "c");
        assertEq(_str.charAt(-2), "b");
        assertEq(_str.charAt(-3), "a");
    }

    function testCannotGetCharThatIsOutOfBounds() public {
        vm.expectRevert("Position out of bounds");
        _str.charAt(3);
    }

    function testSlice() public {
        assertEq(_str.slice(0, 1), "a");
        assertEq(_str.slice(-3, 1), "a");
        assertEq(_str.slice(0, 2), "ab");
        assertEq(_str.slice(-3, -1), "ab");
    }

    function testStartSliceOutOfBounds() public {
        vm.expectRevert("Position out of bounds");
        _str.slice(10, 1);
    }

    function testEndSliceOutOfBounds() public {
        vm.expectRevert("Position out of bounds");
        _str.slice(0, 10);
    }

    function testStartSliceGreaterThanEndSlice() public {
        vm.expectRevert("Start position must be less than end position");
        _str.slice(1, 0);
    }
}
