/*
  Warnings:

  - Added the required column `aplicativoId` to the `User_Motorista` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Profile_Cliente" ADD COLUMN     "aplicativoId" TEXT;

-- AlterTable
ALTER TABLE "Profile_Motorista" ADD COLUMN     "aplicativoId" TEXT;

-- AlterTable
ALTER TABLE "User_Motorista" ADD COLUMN     "aplicativoId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Aplicativo" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "logo" TEXT,
    "cor1" TEXT NOT NULL,
    "cor2" TEXT,
    "cor3" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Aplicativo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Aplicativo_nome_key" ON "Aplicativo"("nome");

-- AddForeignKey
ALTER TABLE "Profile_Cliente" ADD CONSTRAINT "Profile_Cliente_aplicativoId_fkey" FOREIGN KEY ("aplicativoId") REFERENCES "Aplicativo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile_Motorista" ADD CONSTRAINT "Profile_Motorista_aplicativoId_fkey" FOREIGN KEY ("aplicativoId") REFERENCES "Aplicativo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Motorista" ADD CONSTRAINT "User_Motorista_aplicativoId_fkey" FOREIGN KEY ("aplicativoId") REFERENCES "Aplicativo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
