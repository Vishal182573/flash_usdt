import TronWeb from 'tronweb';
import FlashUSDT from '../utils/FlashUSDT.js';
import User from '../models/User.js';

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: process.env.TRON_PRIVATE_KEY
});

export const getBalance = async (req, res) => {
  try {
    const { address } = req.body;
    const balance = await FlashUSDT.methods.balanceOf(address).call();
    res.status(200).json({ balance });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const transfer = async (req, res) => {
  try {
    const { to, amount, address, privateKey } = req.body;
    await FlashUSDT.methods.transfer(to, amount).send({ from: address, privateKey });
    
    const sender = await User.findOne({ address });
    const receiver = await User.findOne({ address: to });

    if (sender && receiver) {
      sender.transactions.push({
        transactionType: 'send',
        address: to,
        amount: amount,
        timestamp: Date.now(),
      });

      receiver.transactions.push({
        transactionType: 'receive',
        address: address,
        amount: amount,
        timestamp: Date.now(),
      });

      await sender.save();
      await receiver.save();
    }

    res.status(200).json({ message: 'Token transferred successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const mint = async (req, res) => {
  try {
    const { amount, address, privateKey } = req.body;
    await FlashUSDT.methods.mint(address, amount).send({ from: address, privateKey });
    res.status(200).json({ message: 'Tokens minted successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const burn = async (req, res) => {
  try {
    const { amount, address, privateKey } = req.body;
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

// New controller for approve function
export const approve = async (req, res) => {
  try {
    const { spender, amount, address, privateKey } = req.body;
    await FlashUSDT.methods.approve(spender, amount).send({ from: address, privateKey });
    res.status(200).json({ message: 'Approval set successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// New controller for transferFrom function
export const transferFrom = async (req, res) => {
  try {
    const { from, to, amount, address, privateKey } = req.body;
    await FlashUSDT.methods.transferFrom(from, to, amount).send({ from: address, privateKey });

    const sender = await User.findOne({ address: from });
    const receiver = await User.findOne({ address: to });

    if (sender && receiver) {
      sender.transactions.push({
        transactionType: 'send',
        address: to,
        amount: amount,
        timestamp: Date.now(),
      });

      receiver.transactions.push({
        transactionType: 'receive',
        address: from,
        amount: amount,
        timestamp: Date.now(),
      });

      await sender.save();
      await receiver.save();
    }

    res.status(200).json({ message: 'Token transferred successfully using transferFrom' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};