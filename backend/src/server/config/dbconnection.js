import { connect as _connect } from "mongoose";
import dotenv from 'dotenv'

dotenv.config();

const connnectDb = async()=>{
    try{
        const connect = await _connect(`${process.env.MONGODB_URI}`);
        console.log("Db connected",connect.connection.host,connect.connection.name);
    }catch(err){
        console.log(err);
        process.exit(1);
    }
}

export default connnectDb;