/*
  Warnings:

  - Made the column `aplicativoId` on table `Profile_Cliente` required. This step will fail if there are existing NULL values in that column.
  - Made the column `aplicativoId` on table `Profile_Motorista` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Profile_Cliente" DROP CONSTRAINT "Profile_Cliente_aplicativoId_fkey";

-- DropForeignKey
ALTER TABLE "Profile_Motorista" DROP CONSTRAINT "Profile_Motorista_aplicativoId_fkey";

-- AlterTable
ALTER TABLE "Profile_Cliente" ALTER COLUMN "aplicativoId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Profile_Motorista" ALTER COLUMN "aplicativoId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Profile_Cliente" ADD CONSTRAINT "Profile_Cliente_aplicativoId_fkey" FOREIGN KEY ("aplicativoId") REFERENCES "Aplicativo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile_Motorista" ADD CONSTRAINT "Profile_Motorista_aplicativoId_fkey" FOREIGN KEY ("aplicativoId") REFERENCES "Aplicativo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
