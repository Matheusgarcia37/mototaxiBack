//create index of page routes
import { Router} from 'express';
import clientesRouter from './cliente.routes';

const router = Router();
router.use('/clientes', clientesRouter);

export default router;
