// Import necessary modules
import express, { json } from "express";
import connectDb from "./config/dbconnection.js";
import cors from "cors";
import authRoutes from "./routes/authRoutes.js"
import tokenRoutes from "./routes/authRoutes.js"
import {FRONTEND_URL} from "./constants.js"

// Connect to MongoDB
connectDb();

// Initialize Express app
const app = express();
const port = process.env.PORT || 3002;

// Set up JSON middleware
app.use(json());
app.use(express.urlencoded({ extended: true }));


// Enable CORS
app.use(
  cors({
    origin: `${FRONTEND_URL}`,
    methods: ["GET", "POST", "PUT", "DELETE"],
    credentials: true,
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);

// Use routes
app.use('/api/auth', authRoutes);
app.use('/api/token', tokenRoutes);
app.get("/",(req,res)=>{
  res.send("server is working");
})

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});