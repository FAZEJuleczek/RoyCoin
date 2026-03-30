// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importujemy sprawdzone standardy (Remix sam je pobierze)
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RoyCoin is ERC20, ERC20Burnable, Ownable {

    // Konstruktor: Tworzy token o nazwie RoyCoin i symbolu ROY
    // Ownable(msg.sender) ustawia Twój portfel jako szefa (Właściciela)
    constructor() ERC20("RoyCoin", "ROY") Ownable(msg.sender) {
        // Generujemy 1,000,000 tokenów na start
        // 18 miejsc po przecinku (decimals) to standard jak w ETH
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Funkcja dla Ciebie (Właściciela), jeśli kiedyś zechcesz dodać więcej monet
    // Jeśli jej nie chcesz, po prostu usuń te 3 linie
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
