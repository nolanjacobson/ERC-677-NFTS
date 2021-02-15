const Anarchapulco = artifacts.require('Anarchapulco')

module.exports = async (deployer, network, [defaultAccount]) => {
  if (network.startsWith('rinkeby')) {
    await deployer.deploy(Anarchapulco)
    let lnj = await Anarchapulco.deployed()
  } else {
    console.log("Right now only rinkeby works! Please change your network to Rinkeby")
  }
}
