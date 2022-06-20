// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract timeUnits {

    //time units, returns always in seconds
    uint public _now = block.timestamp;
    uint public one_minute = 1 minutes;
    uint public two_hours = 2 hours;
    uint public one_day = 1 days;
    uint public one_week = 1 weeks;
    
    function moreSeconds() public view returns(uint) {
        return _now + 50 seconds;
    }
    
    function moreHours() public view returns(uint) {
        return _now + 1 hours;
    }
    
    function moreDays() public view returns(uint) {
        return _now + 3 days;
    }
    
    function moreWeeks() public view returns(uint) {
        return _now + 1 weeks;
    }
}
