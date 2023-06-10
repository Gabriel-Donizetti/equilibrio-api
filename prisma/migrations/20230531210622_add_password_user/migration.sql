/*
  Warnings:

  - Added the required column `senha` to the `usuario` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "senha" TEXT NOT NULL
);
INSERT INTO "new_usuario" ("id", "nome") SELECT "id", "nome" FROM "usuario";
DROP TABLE "usuario";
ALTER TABLE "new_usuario" RENAME TO "usuario";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
