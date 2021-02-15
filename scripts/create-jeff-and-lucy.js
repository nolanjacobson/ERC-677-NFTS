const LucyAndJeff = artifacts.require('LucyAndJeff')

module.exports = async callback => {
  const lnj = await LucyAndJeff.deployed()
  callback(tx.tx)
}
