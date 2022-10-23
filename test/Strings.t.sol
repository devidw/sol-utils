// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Strings.sol";

contract StringsTest is Test {
    using Strings for string;
    string private _str = "abc";
    bytes private _whitespaces = new bytes(6);

    function setUp() public {
        _whitespaces[0] = 0x20;
        _whitespaces[1] = 0x09;
        _whitespaces[2] = 0x0a;
        _whitespaces[3] = 0x0D;
        _whitespaces[4] = 0x0B;
        _whitespaces[5] = 0x00;
    }

    function testLength() public {
        assertEq(_str.length(), 3);
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

    function testLeftTrim() public {
        string memory _trimStr = string.concat(string(_whitespaces), "a");
        assertEq(_trimStr.ltrim(), "a");
    }

    function testLeftTrimWithNoWhitespace() public {
        assertEq(_str.ltrim(), _str);
    }

    function testRightTrim() public {
        string memory _trimStr = string.concat("a", string(_whitespaces));
        assertEq(_trimStr.rtrim(), "a");
    }

    function testRightTrimWithNoWhitespace() public {
        assertEq(_str.rtrim(), _str);
    }

    function testTrim() public {
        string memory _trimStr = string.concat(
            string(_whitespaces),
            "a",
            string(_whitespaces)
        );
        assertEq(_trimStr.trim(), "a");
    }

    function testTrimWithNoWhitespace() public {
        assertEq(_str.trim(), _str);
    }
}
