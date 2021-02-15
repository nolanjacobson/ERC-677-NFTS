const Anarchapulco = artifacts.require('Anarchapulco')

module.exports = async callback => {
    const anarchapulco = await Anarchapulco.deployed()

    // const tx = await anarchapulco.mintSpeaker(90, 100, 65, 75, 100, 85, 95, 100, 100, "Jeff Berwick")
    const tx2 = await anarchapulco.setTokenURI(0, "https://ipfs.io/ipfs/Qme6Ly2MSRtkqCfscEYZToULosihUvyJg5FkAQeC8HPrB4?filename=speaker.json")

    // console.log(tx)
    // console.log(tx2)

    callback(tx2.tx)
}
