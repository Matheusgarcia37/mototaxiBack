/*
  Warnings:

  - You are about to drop the column `cpf` on the `Profile_Motorista` table. All the data in the column will be lost.
  - You are about to drop the column `idade` on the `Profile_Motorista` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[cpf_cnpj]` on the table `Profile_Motorista` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cep` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cidade` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf_cnpj` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data_nascimento` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endereco` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estado` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero_cnh` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero_endereco` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rg` to the `Profile_Motorista` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Profile_Motorista_cpf_key";

-- DropIndex
DROP INDEX "Profile_Motorista_nome_key";

-- DropIndex
DROP INDEX "Profile_Motorista_telefone_key";

-- AlterTable
ALTER TABLE "Profile_Motorista" DROP COLUMN "cpf",
DROP COLUMN "idade",
ADD COLUMN     "categoria_cnh" TEXT,
ADD COLUMN     "cep" TEXT NOT NULL,
ADD COLUMN     "cidade" TEXT NOT NULL,
ADD COLUMN     "cpf_cnpj" TEXT NOT NULL,
ADD COLUMN     "data_nascimento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "endereco" TEXT NOT NULL,
ADD COLUMN     "estado" TEXT NOT NULL,
ADD COLUMN     "numero_cnh" TEXT NOT NULL,
ADD COLUMN     "numero_endereco" TEXT NOT NULL,
ADD COLUMN     "rg" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_cpf_cnpj_key" ON "Profile_Motorista"("cpf_cnpj");
