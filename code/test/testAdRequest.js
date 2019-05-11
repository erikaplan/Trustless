const AdRequest = artifacts.require("AdRequest");


contract("AdRequest", accounts => {

   it("should create AdRequest and check handle", () =>
      AdRequest.new("handle", "caption", 10000000000, {from: accounts[0], value: web3.utils.toWei('1', 'ether')})
      .then(instance => instance.getInfluencerHandle.call({from: accounts[0]}))
      .then(handle => {
         assert.equal(
            handle,
            "handle",
            "10000 wasn't in the first account"
         );
      }));


});
