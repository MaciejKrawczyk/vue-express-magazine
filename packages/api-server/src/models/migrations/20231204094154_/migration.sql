-- CreateTable
CREATE TABLE "ShelfCategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "notes" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Shelf" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "shelfCategoryId" INTEGER NOT NULL,
    CONSTRAINT "Shelf_shelfCategoryId_fkey" FOREIGN KEY ("shelfCategoryId") REFERENCES "ShelfCategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Company" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "notes" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Status" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "itemId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Status_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Item" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "placeId" INTEGER NOT NULL,
    "shelfId" INTEGER,
    "shelfSize" TEXT,
    "itemTypeId" INTEGER NOT NULL,
    "companyId" INTEGER NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "isOrder" BOOLEAN NOT NULL DEFAULT false,
    "orderCategoryId" INTEGER,
    "parcelId" INTEGER,
    CONSTRAINT "Item_shelfId_fkey" FOREIGN KEY ("shelfId") REFERENCES "Shelf" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Item_itemTypeId_fkey" FOREIGN KEY ("itemTypeId") REFERENCES "ItemType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Item_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Item_orderCategoryId_fkey" FOREIGN KEY ("orderCategoryId") REFERENCES "OrderCategory" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Item_parcelId_fkey" FOREIGN KEY ("parcelId") REFERENCES "Parcel" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Parcel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "isSent" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "Parcel_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "OrderCategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "color" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ItemType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "TypeAttribute" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "itemtypeId" INTEGER NOT NULL,
    CONSTRAINT "TypeAttribute_itemtypeId_fkey" FOREIGN KEY ("itemtypeId") REFERENCES "ItemType" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AttributeValue" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "value" TEXT NOT NULL,
    "itemId" INTEGER NOT NULL,
    "typeAttributeId" INTEGER NOT NULL,
    CONSTRAINT "AttributeValue_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "AttributeValue_typeAttributeId_fkey" FOREIGN KEY ("typeAttributeId") REFERENCES "TypeAttribute" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "ShelfCategory_name_key" ON "ShelfCategory"("name");

-- CreateIndex
CREATE INDEX "Shelf_shelfCategoryId_idx" ON "Shelf"("shelfCategoryId");

-- CreateIndex
CREATE UNIQUE INDEX "Company_name_key" ON "Company"("name");

-- CreateIndex
CREATE INDEX "Status_itemId_idx" ON "Status"("itemId");

-- CreateIndex
CREATE INDEX "Item_shelfId_itemTypeId_companyId_orderCategoryId_parcelId_idx" ON "Item"("shelfId", "itemTypeId", "companyId", "orderCategoryId", "parcelId");

-- CreateIndex
CREATE INDEX "Parcel_companyId_idx" ON "Parcel"("companyId");

-- CreateIndex
CREATE UNIQUE INDEX "ItemType_name_key" ON "ItemType"("name");

-- CreateIndex
CREATE INDEX "TypeAttribute_itemtypeId_idx" ON "TypeAttribute"("itemtypeId");

-- CreateIndex
CREATE INDEX "AttributeValue_itemId_typeAttributeId_idx" ON "AttributeValue"("itemId", "typeAttributeId");
