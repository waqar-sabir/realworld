-- CreateTable
CREATE TABLE "_UserDisliked" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_UserDisliked_AB_unique" ON "_UserDisliked"("A", "B");

-- CreateIndex
CREATE INDEX "_UserDisliked_B_index" ON "_UserDisliked"("B");

-- AddForeignKey
ALTER TABLE "_UserDisliked" ADD CONSTRAINT "_UserDisliked_A_fkey" FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserDisliked" ADD CONSTRAINT "_UserDisliked_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
