pragma solidity ^0.4.13;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/AdRequest.sol";

contract TestAdRequest {
    function testInfluencerHandle() {
        uint deadline = now + 7 days;
        AdRequest ad = new AdRequest("handle", "caption", deadline);
        Assert.equal(ad.getInfluencerHandle(), "handle", "Handle incorrect");
    }
/*
    function testInfluencerHandleFail() {

    }
*/

}
