import TronWeb from 'tronweb';
import dotenv from 'dotenv'

dotenv.config();

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: process.env.TRON_PRIVATE_KEY
});


export const createAccount = async () => {
  const account = await tronWeb.createAccount();
  return { address: account.address, privateKey: account.privateKey };
};