/*
  Warnings:

  - You are about to drop the `ArticleTags` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_UserDisliked` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `Tag` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "ArticleTags" DROP CONSTRAINT "ArticleTags_articleId_fkey";

-- DropForeignKey
ALTER TABLE "ArticleTags" DROP CONSTRAINT "ArticleTags_tagId_fkey";

-- DropForeignKey
ALTER TABLE "_UserDisliked" DROP CONSTRAINT "_UserDisliked_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserDisliked" DROP CONSTRAINT "_UserDisliked_B_fkey";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "image" SET DEFAULT 'https://api.realworld.io/images/smiley-cyrus.jpeg';

-- DropTable
DROP TABLE "ArticleTags";

-- DropTable
DROP TABLE "_UserDisliked";

-- CreateTable
CREATE TABLE "_ArticleToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ArticleToTag_AB_unique" ON "_ArticleToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_ArticleToTag_B_index" ON "_ArticleToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_name_key" ON "Tag"("name");

-- AddForeignKey
ALTER TABLE "_ArticleToTag" ADD CONSTRAINT "_ArticleToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArticleToTag" ADD CONSTRAINT "_ArticleToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "Article.slug_unique" RENAME TO "Article_slug_key";

-- RenameIndex
ALTER INDEX "User.email_unique" RENAME TO "User_email_key";

-- RenameIndex
ALTER INDEX "User.username_unique" RENAME TO "User_username_key";
