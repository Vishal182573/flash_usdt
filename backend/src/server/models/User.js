import { Schema, model } from "mongoose";

const transactionSchema = new Schema(
  {
    transactionType: {
      type: String,
      enum: ['send', 'receive'], // Defines whether the transaction was sent or received
      required: true,
    },
    address: {
      type: String,
      required: true, // The address involved in the transaction (sender or receiver)
    },
    amount: {
      type: Number,
      required: true, // The amount of tokens sent or received
    },
    timestamp: {
      type: Date,
      default: Date.now, // The time the transaction took place
    },
  }
);

const userSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    address: {
      type: String,
      required: true,
    },
    privateKey: {
      type: String,
      required: true,
    },
    transactions: [transactionSchema], // Array of transaction objects
  },
  { timestamps: true }
);

export default model("User", userSchema);
