import { Router } from 'express';
import clientesController from '../controllers/clientesController';
const clienteRouter = Router();

clienteRouter.post('/', clientesController.store);


export default clienteRouter;