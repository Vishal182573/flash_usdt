import TronWeb from 'tronweb';
import dotenv from 'dotenv'

dotenv.config();

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: process.env.TRON_PRIVATE_KEY
});

const flashUsdtAddress = process.env.FLASHUSDT_ADDRESS; // Address of the deployed FlashUSDT contract
const flashUsdtABI = [ process.env.FLASHUSDT_ABI ];

const FlashUSDT = tronWeb.contract(flashUsdtABI, flashUsdtAddress);

export default FlashUSDT;