import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express';

const prisma = new PrismaClient();


class ClientesController {
  async store(req: Request, res: Response) {  
    const { nome, telefone } = req.body;
    const existCliente = await prisma.profile_Cliente.findUnique({
      where: {
        telefone
      }
    })
    if (existCliente) {
      return res.status(400).json({ error: 'Cliente já cadastrado' });
    }
    
    const cliente = await prisma.profile_Cliente.create({
      data: {
        nome,
        telefone,
      }
    });
    return res.status(200).json(cliente);
  }
}

export default new ClientesController();