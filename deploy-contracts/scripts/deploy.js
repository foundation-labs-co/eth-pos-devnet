async function main() {
    console.log("📡 Deploy Deposit Contract")

    const [deployer] = await ethers.getSigners()
    console.log("Deployer address:", deployer.address)

    let DepositContract = await ethers.getContractFactory('DepositContract')
    DepositContract = DepositContract.connect(deployer)

    // Deploy
    const depositContract = await DepositContract.deploy()
    console.log("Deposit contract address:", depositContract.address)

    // Wait for the transaction to be mined
    console.log("...")
    await depositContract.deployTransaction.wait()

    // Get the transaction receipt and block number
    let receipt = await ethers.provider.getTransactionReceipt(depositContract.deployTransaction.hash)
    console.log("Deployed at block number:", receipt.blockNumber)
    console.log("Deploy Success")
}

main().catch((error) => {
    console.error(error)
    process.exitCode = 1
});
