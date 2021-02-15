const LucyAndJeff = artifacts.require('LucyAndJeff')

module.exports = async (deployer, network, [defaultAccount]) => {
  if (network.startsWith('rinkeby')) {
    await deployer.deploy(LucyAndJeff)
    let lnj = await LucyAndJeff.deployed()
  } else {
    console.log("Right now only rinkeby works! Please change your network to Rinkeby")
  }
}
