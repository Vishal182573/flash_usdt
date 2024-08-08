import TronWeb from 'tronweb';
import FlashUSDT from '../utils/FlashUSDT.js';

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: process.env.TRON_PRIVATE_KEY
});

export const getBalance = async (req, res) => {
  try {
    const { address } = req.user;
    const balance = await FlashUSDT.methods.balanceOf(address).call();
    res.status(200).json({ balance });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const transfer = async (req, res) => {
  try {
    const { to, amount } = req.body;
    const { address, privateKey } = req.user;
    await FlashUSDT.methods.transfer(to, amount).send({ from: address, privateKey });
    res.status(200).json({ message: 'Token transferred successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const mint = async (req, res) => {
  try {
    const { amount } = req.body;
    const { address, privateKey } = req.user;
    await FlashUSDT.methods.mint(address, amount).send({ from: address, privateKey });
    res.status(200).json({ message: 'Tokens minted successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const burn = async (req, res) => {
  try {
    const { amount } = req.body;
    const { address, privateKey } = req.user;
    await FlashUSDT.methods.burn(amount).send({ from: address, privateKey });
    res.status(200).json({ message: 'Tokens burned successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getAllowance = async (req, res) => {
  try {
    const { owner, spender } = req.query;
    const allowance = await FlashUSDT.methods.allowance(owner, spender).call();
    res.status(200).json({ allowance });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
