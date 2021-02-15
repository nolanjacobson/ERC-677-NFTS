const LucyAndJeff = artifacts.require('LucyAndJeff')

module.exports = async callback => {
    const lnj = await LucyAndJeff.deployed()
    console.log('Let\'s set the tokenURI of your characters')
    // const tx = await lnj.setTokenURI(0, "https://ipfs.io/ipfs/QmXdZg9rsBCkULwnW8prhQxc2Bwkr2PMxSwRPpq3mRAjH4?filename=lucy-and-jeff.json")
    const tx2 = await lnj.getTokenURI(0)

    // console.log(tx)
    console.log(tx2)

    callback(tx2.tx)
}
