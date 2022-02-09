/*
  Warnings:

  - You are about to drop the column `nome` on the `Aplicativo` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nome_app_c]` on the table `Aplicativo` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nome_app_m]` on the table `Aplicativo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nome_app_c` to the `Aplicativo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_app_m` to the `Aplicativo` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Aplicativo_nome_key";

-- AlterTable
ALTER TABLE "Aplicativo" DROP COLUMN "nome",
ADD COLUMN     "nome_app_c" TEXT NOT NULL,
ADD COLUMN     "nome_app_m" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Aplicativo_nome_app_c_key" ON "Aplicativo"("nome_app_c");

-- CreateIndex
CREATE UNIQUE INDEX "Aplicativo_nome_app_m_key" ON "Aplicativo"("nome_app_m");
