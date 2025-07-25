import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import User from '../models/User.js';
import asyncHandler from "express-async-handler"
import * as tronscan from '../services/tronscan.js';

export const register = asyncHandler(async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }

    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    // const { address, privateKey } = await tronscan.createAccount();
    const privateKey="sojgosnhrnaenijnsitjhnfkjnhjftnhtjknhktnh";
    const address="TRkdjnrkjanekjtnsknh";
    const user = new User({ name, email, password: hashedPassword, address, privateKey,transactions:[]});
    await user.save();

    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET);
    res.status(201).json({ token, user: { userId: user._id, address, privateKey } });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

export const login = asyncHandler(async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }

    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }

    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET);
    res.status(200).json({ token, user: { userId: user._id, address: user.address, privateKey: user.privateKey } });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});