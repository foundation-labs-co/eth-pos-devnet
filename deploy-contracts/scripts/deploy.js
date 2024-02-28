async function main() {
    // console.log("📡 Deploy Deposit Contract")

    const [deployer] = await ethers.getSigners()
    // console.log("Deployer address:", deployer.address)

    let DepositContract = await ethers.getContractFactory('DepositContract')
    DepositContract = DepositContract.connect(deployer)

    // Deploy
    const depositContract = await DepositContract.deploy()
    console.log("DEPOSIT_CONTRACT_ADDRESS:", depositContract.address)

    // Wait for the transaction to be mined
    await depositContract.deployTransaction.wait()

    // Get the transaction receipt and block number
    let receipt = await ethers.provider.getTransactionReceipt(depositContract.deployTransaction.hash)
    console.log("DEPOSIT_BLOCK_NUMBER:", receipt.blockNumber)
    // console.log("Deploy Success")
}

main().catch((error) => {
    console.error(error)
    process.exitCode = 1
});
