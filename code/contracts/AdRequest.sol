pragma solidity >=0.4.25;
contract AdRequest {
    // Represents an Instagram influencer
    struct Influencer {
        string instagramHandle;
        address account;
    }

    // Represents an advertiser
    struct Advertiser {
        address account;      
        uint256 payout;
    }

    struct Image {
        string caption;
        uint deadline;
    }

    Influencer influencer;
    Advertiser advertiser;
    Image image;
    uint MIN_DEADLINE = 3 days;

    constructor(string memory handle, string memory caption, uint deadline) 
        public 
        payable
    {
        influencer.instagramHandle = handle; 
        advertiser.account = msg.sender;
        require(msg.value > 0, 
                "Payout must be greater than 0.");
        advertiser.payout = msg.value;
        image.caption = caption;
        require(block.timestamp + MIN_DEADLINE < deadline, 
                "Deadline must be at least 3 days from now.");
        image.deadline = deadline;
    }

    function getInfluencerHandle() 
        public view returns (string memory)
    {
        return influencer.instagramHandle;
    }

    function getAdvertiserAccount()
        public view returns (address)
    {
        return advertiser.account;
    }

    function getPayout()
        public view returns (uint256) 
    {
        return advertiser.payout;
    }

    function getCaption() 
        public view returns (string memory)
    {
        return image.caption;
    }

    function getDeadline()
        public view returns (uint)
    {
        return image.deadline;
    }
}
