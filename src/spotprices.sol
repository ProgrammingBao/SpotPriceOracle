// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

interface ICurvePool {
    function get_dy(int128 i, int128 j, uint256 dx) external view returns (uint256);
    function coins(uint256 idx) external view returns (address);
}

contract CurveSpotPrice {
    // Fetch the spot price from a given Curve pool
    // `poolAddress` is the address of the Curve pool
    // `tokenIndexFrom` and `tokenIndexTo` are the indices of the tokens in the Curve pool
    function getSpotPrice(address poolAddress, int128 tokenIndexFrom, int128 tokenIndexTo, uint256 amount) external view returns (uint256) {
        ICurvePool pool = ICurvePool(poolAddress);
        return pool.get_dy(tokenIndexFrom, tokenIndexTo, amount);
    }

    // This function is an added utility to fetch token addresses for a given pool
    // This can help in identifying the indices of tokens in a pool
    function getTokenAddress(address poolAddress, uint256 idx) external view returns (address) {
        ICurvePool pool = ICurvePool(poolAddress);
        return pool.coins(idx);
    }
}
