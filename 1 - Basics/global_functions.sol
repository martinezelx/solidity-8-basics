// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract global_functions{

    function MsgSender() public view returns(address){
        return msg.sender;
    }

     function Now() public view returns(uint){
        return block.timestamp;
    }

     function BlockCoinbase() public view returns(address){
        return block.coinbase;
    }

     function BlockDifficulty() public view returns(uint){
        return block.difficulty;
    }

     function BlockNumber() public view returns(uint){
        return block.number;
    }

     function MsgSig() public pure returns(bytes4){
        return msg.sig;
    }

     function TxGasPrice() public view returns(uint){
        return tx.gasprice;
    }
}
