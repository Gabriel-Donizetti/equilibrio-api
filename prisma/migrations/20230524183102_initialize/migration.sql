-- CreateTable
CREATE TABLE "usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "empresa" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "usuario_id" TEXT NOT NULL,
    CONSTRAINT "empresa_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "form_data" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "data" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "tecnico" TEXT NOT NULL,
    "condicao_tempo" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "dosage_acidulante" (
    "form_id" INTEGER NOT NULL,
    "dosagem" TEXT NOT NULL,
    "ponto_dosagem" TEXT NOT NULL,
    "estoque" REAL NOT NULL,
    "produto_usado" TEXT NOT NULL,
    CONSTRAINT "dosage_acidulante_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "dosagem_coagulante" (
    "form_id" INTEGER NOT NULL,
    "dosagem" TEXT NOT NULL,
    "ponto_dosagem" TEXT NOT NULL,
    "estoque" REAL NOT NULL,
    "produto_usado" TEXT NOT NULL,
    CONSTRAINT "dosagem_coagulante_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "dosagem_hipoclorito" (
    "form_id" INTEGER NOT NULL,
    "dosagem" TEXT NOT NULL,
    "ponto_dosagem" TEXT NOT NULL,
    "estoque" REAL NOT NULL,
    CONSTRAINT "dosagem_hipoclorito_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "caixa_recalque" (
    "form_id" INTEGER NOT NULL,
    "nivel" TEXT NOT NULL,
    "ph" REAL NOT NULL,
    CONSTRAINT "caixa_recalque_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tanque_equalizacao" (
    "form_id" INTEGER NOT NULL,
    "nivel" TEXT NOT NULL,
    "ph" TEXT NOT NULL,
    CONSTRAINT "tanque_equalizacao_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "reator1" (
    "form_id" INTEGER NOT NULL,
    "solidos" INTEGER NOT NULL,
    "ph" REAL NOT NULL,
    CONSTRAINT "reator1_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "reator2" (
    "form_id" INTEGER NOT NULL,
    "solidos" INTEGER NOT NULL,
    "ph" REAL NOT NULL,
    CONSTRAINT "reator2_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "efluente_tratado" (
    "form_id" INTEGER NOT NULL,
    "ph" REAL NOT NULL,
    "arraste_lodo" TEXT NOT NULL,
    "vazao_calha_parshall" INTEGER NOT NULL,
    CONSTRAINT "efluente_tratado_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "medidor_vazao_ETE" (
    "form_id" INTEGER NOT NULL,
    "totalizador" INTEGER NOT NULL,
    "vazao_totalizador" INTEGER NOT NULL,
    CONSTRAINT "medidor_vazao_ETE_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "hidrometros_descartes" (
    "form_id" INTEGER NOT NULL,
    "hidrometro_CUC" REAL NOT NULL,
    "hidrometro_pintura" INTEGER NOT NULL,
    CONSTRAINT "hidrometros_descartes_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "hidrometro_poco" (
    "form_id" INTEGER NOT NULL,
    "hidrometro_poco" INTEGER NOT NULL,
    "hidrometro_bomba_poco" INTEGER NOT NULL,
    CONSTRAINT "hidrometro_poco_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "cloro" (
    "form_id" INTEGER NOT NULL,
    "ponto_analise" TEXT NOT NULL,
    "valor" REAL NOT NULL,
    "ph_poco" REAL NOT NULL,
    CONSTRAINT "cloro_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Lodo" (
    "form_id" INTEGER NOT NULL,
    "descartando" TEXT NOT NULL,
    "filtro_prensa" TEXT NOT NULL,
    "nivel_cacamba" INTEGER NOT NULL,
    CONSTRAINT "Lodo_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "form_data" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "dosage_acidulante_form_id_key" ON "dosage_acidulante"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "dosagem_coagulante_form_id_key" ON "dosagem_coagulante"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "dosagem_hipoclorito_form_id_key" ON "dosagem_hipoclorito"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "caixa_recalque_form_id_key" ON "caixa_recalque"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "tanque_equalizacao_form_id_key" ON "tanque_equalizacao"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "reator1_form_id_key" ON "reator1"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "reator2_form_id_key" ON "reator2"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "efluente_tratado_form_id_key" ON "efluente_tratado"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "medidor_vazao_ETE_form_id_key" ON "medidor_vazao_ETE"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "hidrometros_descartes_form_id_key" ON "hidrometros_descartes"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "hidrometro_poco_form_id_key" ON "hidrometro_poco"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "cloro_form_id_key" ON "cloro"("form_id");

-- CreateIndex
CREATE UNIQUE INDEX "Lodo_form_id_key" ON "Lodo"("form_id");
