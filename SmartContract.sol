// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ProductPassport {
    struct Product {
        string name;
        string serialNumber;
        string imageUrl;
        address owner;
    }

    mapping(uint256 => Product) private products;
    mapping(bytes32 => bool) private registeredSerials;
    uint256 private productCount;

    event ProductRegistered(uint256 indexed productId, string name, address indexed owner);
    event OwnershipTransferred(uint256 indexed productId, address indexed previousOwner, address indexed newOwner);

    function registerProduct(string calldata name, string calldata serialNumber, string calldata imageUrl) external returns (uint256) {
        require(bytes(name).length > 0 && bytes(name).length <= 80, "Name must be 1-80 bytes");
        require(bytes(serialNumber).length > 0 && bytes(serialNumber).length <= 64, "Serial must be 1-64 bytes");
        require(bytes(imageUrl).length <= 300, "Image URL too long");
        bytes32 serialHash = keccak256(bytes(serialNumber));
        require(!registeredSerials[serialHash], "Serial already registered");
        productCount += 1;
        uint256 productId = productCount;
        products[productId] = Product({name: name, serialNumber: serialNumber, imageUrl: imageUrl, owner: msg.sender});
        registeredSerials[serialHash] = true;
        emit ProductRegistered(productId, name, msg.sender);
        return productId;
    }

    function getProduct(uint256 productId) external view returns (Product memory) {
        require(productId > 0 && productId <= productCount, "Product does not exist");
        return products[productId];
    }

    function transferOwnership(uint256 productId, address newOwner) external {
        require(productId > 0 && productId <= productCount, "Product does not exist");
        Product storage product = products[productId];
        require(msg.sender == product.owner, "Only the owner can transfer");
        require(newOwner != address(0), "Invalid recipient");
        require(newOwner != product.owner, "Recipient already owns product");
        address previousOwner = product.owner;
        product.owner = newOwner;
        emit OwnershipTransferred(productId, previousOwner, newOwner);
    }

    function getProductCount() external view returns (uint256) {
        return productCount;
    }
}
