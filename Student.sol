// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Student{

    struct StudentDetails {
        uint256 id;
        string name;
        
    }

    StudentDetails[] public studarr;

    function addStudent(string memory name,uint256 id) public {
        for (uint256 i=0;i<studarr.length;i++){
            if (studarr[i].id == id){
                revert("student already exist");
            }
        }
        studarr.push(StudentDetails(id,name));
    }

    function getStudLength() public view returns (uint256){
        return studarr.length;
    }

    function displayStudents() public view returns (StudentDetails[] memory){
        return studarr;
    }

    function getStudByIndex(uint idx) public view returns(StudentDetails memory){
       require(idx<studarr.length,"invalid index");
        return studarr[idx];
    }

    fallback() external payable { 
        //handle external function calls not present in contract
    }

    receive() external payable { 
        //handle native token transfers
        //msg.value is the amount of native token sent
    }
    
}