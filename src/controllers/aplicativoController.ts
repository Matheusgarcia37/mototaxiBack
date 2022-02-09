import { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

class AplicativoController {
    async storage(req: Request, res: Response) {
        try {
            const { nome, logo, cor1, cor2, cor3 } = req.body;
            const existAplicativo = await prisma.aplicativo.findUnique({
                where: {
                    nome: nome
                }
            })
            if (existAplicativo) {
                return res.status(400).json({ message: "Erro ao cadastrar aplicativo, já existe um aplicativo com esse nome" });
            }
            const aplicativo = await prisma.aplicativo.create({
                data: {
                    nome,
                    logo,
                    cor1,
                    cor2,
                    cor3
                }
            })

            return res.json(aplicativo);
        } catch (error) {
            console.log(error);
            return res.status(400).json({ message: "Erro ao cadastrar aplicativo" });
        }
    }
}

export default new AplicativoController();