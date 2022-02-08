-- CreateTable
CREATE TABLE "Profile_Cliente" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "foto" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_Cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile_Motorista" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "foto" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "cpf" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "user_MotoristaId" TEXT NOT NULL,

    CONSTRAINT "Profile_Motorista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Motorista" (
    "id" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_Motorista_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Cliente_nome_key" ON "Profile_Cliente"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Cliente_telefone_key" ON "Profile_Cliente"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_nome_key" ON "Profile_Motorista"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_telefone_key" ON "Profile_Motorista"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_email_key" ON "Profile_Motorista"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_cpf_key" ON "Profile_Motorista"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_Motorista_user_MotoristaId_key" ON "Profile_Motorista"("user_MotoristaId");

-- CreateIndex
CREATE UNIQUE INDEX "User_Motorista_login_key" ON "User_Motorista"("login");

-- AddForeignKey
ALTER TABLE "Profile_Motorista" ADD CONSTRAINT "Profile_Motorista_user_MotoristaId_fkey" FOREIGN KEY ("user_MotoristaId") REFERENCES "User_Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
