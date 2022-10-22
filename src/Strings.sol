// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Strings {
    function charAt(string memory _str, int256 _pos)
        internal
        pure
        returns (string memory _char)
    {
        bytes memory _inArr = bytes(_str);
        uint256 _index;
        if (_pos >= 0) {
            _index = uint256(_pos);
        } else {
            _index = uint256(int256(_inArr.length) + _pos);
        }
        require(_inArr.length > _index, "Position out of bounds");
        bytes memory _outArr = new bytes(1);
        _outArr[0] = _inArr[_index];
        _char = string(_outArr);
    }
}
