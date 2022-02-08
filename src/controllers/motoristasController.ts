import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

class MotoristasController {
  async store(req: Request, res: Response) {
    const { nome, email, rg, cpf_cnpj, numero_cnh, categoria_cnh, endereco, numero_endereco, cep, cidade, estado, telefone, data_nascimento } = req.body;
  
    const existMotorista = await prisma.profile_Motorista.findUnique({
      where: {
        email
      }
    })
    if (existMotorista) {
      return res.status(400).json({ error: 'Motorista já cadastrado' });
    }
  }
}

export default new MotoristasController();