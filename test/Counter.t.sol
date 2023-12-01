// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "../lib/forge-std/src/Test.sol";
import "../src/spotprices.sol";  // Adjust the path as necessary

contract CurveSpotPriceTest is Test {
    CurveSpotPrice curveSpotPrice;
    address constant DAI_ADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant THREE_POOL_ADDRESS = 0xbEbc44782C7dB0a1A60Cb6fe97d0b483032FF1C7;

    function setUp() public {
        curveSpotPrice = new CurveSpotPrice();
    }

    function testGetSpotPriceForDAI() public {
        // Assuming DAI is at index 0 in the 3Pool
        int128 daiIndex = 0;

        // Use a dummy amount for testing
        uint256 amount = 1e18; // 1 DAI

        uint256 price = curveSpotPrice.getSpotPrice(THREE_POOL_ADDRESS, daiIndex, daiIndex, amount);
        assertGt(price, 0, "Spot price should be greater than 0");
        emit log_named_uint("DAI Spot Price in DAI (for 1 DAI)", price);
    }
}