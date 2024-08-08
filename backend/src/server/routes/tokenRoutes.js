import express from 'express';
const router = express.Router();
import * as tokenController from '../controllers/tokenController.js';
import auth from '../middleware/auth.js';

router.get('/balance', auth, tokenController.getBalance);
router.post('/transfer', auth, tokenController.transfer);
router.post('/mint', auth, tokenController.mint);
router.post('/burn', auth, tokenController.burn);
router.get('/allowance', auth, tokenController.getAllowance);

export default router;