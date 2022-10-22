// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Strings.sol";

contract StringsTest is Test {
    using Strings for string;
    string private _str = "abc";

    function testCannotGetCharThatIsOutOfBounds() public {
        vm.expectRevert("Position out of bounds");
        _str.charAt(3);
    }

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
}
