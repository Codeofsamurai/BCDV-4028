// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyTargetContract {
    uint public value;

    function setValue(uint _newValue) public {
        value = _newValue;
    }
}

contract DelegatorContract {
    address public MytargetContract;
    uint public delegatedValue;

    constructor(address _MytargetContract) {
        MytargetContract = _MytargetContract;
    }

    function delegateSetValue(uint _newValue) public {
        // HEre, we Perform a delegate call to the target contract's setValue function
        (bool success, bytes memory result) = MytargetContract.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _newValue)
        );

        require(success, "Delegate call failed");

        // FInally, we Retrieve the updated value from the delegate call result
        delegatedValue = abi.decode(result, (uint));
    }
}
