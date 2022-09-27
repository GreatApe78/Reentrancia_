const HDWalletProvider = require('@truffle/hdwallet-provider'); //Lembre-se de instalar essa biblioteca para deploiar os contratos nas redes remotas (Mainnet, Rinkeby, Ropsten, Goerli, etc)
const fs = require('fs');

//const infuraKey = fs.readFileSync("infura_key");
//const mnemonic = fs.readFileSync(".secret").toString().trim(); //Leitura da frase secreta contida no arquivo .secret
module.exports = {
  networks: {
    development: { //Use esse nome se quiser deploiar no ganache pelo terminal. Para usar a interface grafica, use a porta 7545
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    rinkeby: { //Exemplo de rede de teste. Para usar outra rede, basta adiciona-la trocando o nome, o id da rede e a chave do infura correspondente
      provider: () => new HDWalletProvider(mnemonic, infuraKey),
      network_id: 4,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 600,
      skipDryRun: true
    },
  },
  compilers: {
    solc: {
      version: "^0.8.2",    //Essa versao deve ser a mesma utilizada nos contratos Solidity. Se mudar a versao dos contratos, mude a versao aqui tambem
    }
  },
}