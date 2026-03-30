// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Twój kontrakt RoyCoin
contract RoyCoin is ERC20, Ownable {
    
    // Konstruktor: Wywołuje się tylko RAZ przy narodzinach tokena
    constructor() ERC20("RoyCoin", "ROY") Ownable(msg.sender) {
        // Tworzymy 1,000,000 tokenów i wysyłamy je na Twój portfel
        // decimals() to 18 miejsc po przecinku (standard)
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Funkcja spalania: Możesz spalić swoje tokeny, żeby zmniejszyć podaż (Burn)
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
