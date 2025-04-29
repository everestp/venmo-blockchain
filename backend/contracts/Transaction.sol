//SPDX-Liscene-Identifer :UnLinsced
 pragma solidity ^0.8.15;

contract Transaction {
    //Number if trasaction
    uint256 transactionCount;

    //This will be an event fired when the trasaction is  made
    event Trasfer(address from ,address reciever ,uint amount ,string message ,uint timeStamp);

    //Struct of the trasaction that wil be storing on chain
    struct  TransferStruct{
        address from;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
    }

    //Array  of Trnsaction
TransferStruct[] transaction;

//Function to addd a trasaction ti to the blovkchain with our struct

//payable keyword here means that the receiver is  able to recive ether form sender.

function addToBlockChain(address payable receiver,uint amount,string memory message) public {
 transactionCount +=1;
 transaction.push(TransferStruct(msg.sender ,receiver ,amount,message,block.timestamp));

 //emit the event we create ealrier
 emit Trasfer(msg.sender, receiver, amount, message, block.timestamp);
}

// funcrtrion to get all trasactions
function getAllTrasnaction() public view returns (TransferStruct[] memory){
    return transaction;
}
   //funtion  to gt numbner of  trasaction
   function getAllTrasnactionCount() public view returns (uint256){
    return transactionCount;
}


// view keyord means that the functions can only be  used to view the data  therefore no ether is required to view  the data
}