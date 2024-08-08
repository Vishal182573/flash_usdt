import TronWeb from 'tronweb';
import dotenv from 'dotenv'

dotenv.config();

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: process.env.TRON_PRIVATE_KEY
});

const flashUsdtAddress = '0x123456789abcdef'; // Address of the deployed FlashUSDT contract
const flashUsdtABI = [ /* ABI of the FlashUSDT contract */ ];

const FlashUSDT = tronWeb.contract(flashUsdtABI, flashUsdtAddress);

export default FlashUSDT;