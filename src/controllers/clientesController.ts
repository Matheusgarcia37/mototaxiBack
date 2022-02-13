import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express';

const prisma = new PrismaClient();


class ClientesController {
  async store(req: Request, res: Response) {
    const { nome, telefone, aplicativoId } = req.body;

    if (!nome || !telefone || !aplicativoId) {
      return res.status(400).json({
        error: 'Nome, telefone e aplicativo são obrigatórios',
      });
    }

    const existCliente = await prisma.profile_Cliente.findFirst({
      where: {
        telefone,
        aplicativoId
      } as any
    })
    if (existCliente) {
      return res.status(400).json({ error: 'Cliente já cadastrado' });
    }

    const cliente = await prisma.profile_Cliente.create({
      data: {
        nome,
        telefone,
        aplicativoId
      }
    });
    return res.status(200).json(cliente);
  }

  async verifyCliente(req: Request, res: Response) {
    const { clienteId, telefone, aplicativoId } = req.body;
    if (!clienteId || !telefone || !aplicativoId) {
      return res.status(400).json({
        error: 'Nome, telefone e aplicativo são obrigatórios',
      });
    }

    const cliente = prisma.profile_Cliente.findFirst({
      where: {
        id: clienteId,
        telefone,
        aplicativoId
      }
    });
    if(cliente) {
      return res.status(200).json(cliente);
    } else {
      return res.status(400).json({ error: 'Cliente não encontrado' });
    }
  }
}

export default new ClientesController();