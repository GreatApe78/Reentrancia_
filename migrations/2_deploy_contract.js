const Store = artifacts.require("Store");
const Attack = artifacts.require("Attack");


module.exports = async (deployer,network,accounts)=>{

    await deployer.deploy(Store);

    var instance = await Store.deployed();

    await deployer.deploy(Attack,instance.address,{from: accounts[1]});

    await Attack.deployed();



}