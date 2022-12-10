// SPDX-License-Identifier: BlueOak-1.0.0
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "../../libraries/Fixed.sol";
import "./ERC20Mock.sol";
import "../../plugins/reth/IRocketNetworkBalances.sol";

contract RETHMock is ERC20Mock {
    using FixLib for uint192;
    uint256 internal _exchangeRate;

    constructor(
        string memory name,
        string memory symbol
    ) ERC20Mock(name, symbol) {
        _exchangeRate = FIX_ONE;
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function getExchangeRate() external view returns (uint256) {
        return _exchangeRate;
    }

    function setExchangeRate(uint256 exchangeRate) external {
        _exchangeRate = exchangeRate;
    }
}
