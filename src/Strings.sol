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
        _index = _translateIndex(_pos, _inArr.length);
        bytes memory _outArr = new bytes(1);
        _outArr[0] = _inArr[_index];
        _char = string(_outArr);
    }

    function slice(
        string memory _str,
        int256 _start,
        int256 _end
    ) internal pure returns (string memory out) {
        bytes memory _inArr = bytes(_str);
        uint256 _startPos;
        uint256 _endPos;
        _startPos = _translateIndex(_start, _inArr.length);
        _endPos = _translateIndex(_end, _inArr.length);
        require(
            _startPos <= _endPos,
            "Start position must be less than end position"
        );
        bytes memory _outArr = new bytes(_endPos - _startPos);
        for (uint256 i = _startPos; i < _endPos; i++) {
            _outArr[i - _startPos] = _inArr[i];
        }
        out = string(_outArr);
    }

    function _translateIndex(int256 _index, uint256 _length)
        private
        pure
        returns (uint256 _translated)
    {
        if (_index < 0) {
            _translated = uint256(int256(_length) + _index);
        } else {
            _translated = uint256(_index);
        }
        require(_translated < _length, "Position out of bounds");
    }
}
