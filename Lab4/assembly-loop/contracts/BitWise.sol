pragma solidity ^0.5.0;

contract BitWise {
    // count the number of bit set in data.  i.e. data = 7, result = 3
    function countBitSet(uint8 data) public pure returns (uint8 result) {
        for (uint256 i = 0; i < 8; i += 1) {
            if (((data >> i) & 1) == 1) {
                result += 1;
            }
        }
    }

    function countBitSetAsm(uint8 data) public pure returns (uint8 result) {
        // replace line 15 with inline assembly code
        assembly {
            for {let i := 0 } 
            lt(i, 8) 
            { i := add(i, 1) }
            {
                let byteShifted := shr(i, data)
                let andResult := and(byteShifted, 1)
                if eq(andResult, 1) {
                    result := add(result, 1)
                }
            }
        }
    }
}
