-- CreateEnum
CREATE TYPE "public"."FuelType" AS ENUM ('PETROL', 'DIESEL', 'HYBRID', 'ELECTRIC');

-- CreateEnum
CREATE TYPE "public"."Transmission" AS ENUM ('MANUAL', 'AUTOMATIC');

-- CreateEnum
CREATE TYPE "public"."VehicleCondition" AS ENUM ('NEW', 'USED', 'REFURBISHED');

-- CreateEnum
CREATE TYPE "public"."VehicleStatus" AS ENUM ('AVAILABLE', 'RESERVED', 'SOLD', 'MAINTENANCE');

-- CreateTable
CREATE TABLE "public"."vehicles" (
    "id" TEXT NOT NULL,
    "vin" TEXT NOT NULL,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "engine_size" TEXT NOT NULL,
    "fuel_type" "public"."FuelType" NOT NULL,
    "transmission" "public"."Transmission" NOT NULL,
    "mileage" INTEGER NOT NULL,
    "condition" "public"."VehicleCondition" NOT NULL,
    "purchase_price" DECIMAL(12,2) NOT NULL,
    "expected_selling_price" DECIMAL(12,2) NOT NULL,
    "actual_selling_price" DECIMAL(12,2),
    "arrival_date" TIMESTAMP(3) NOT NULL,
    "sale_date" TIMESTAMP(3),
    "status" "public"."VehicleStatus" NOT NULL DEFAULT 'AVAILABLE',
    "location" TEXT NOT NULL,
    "images" JSONB,
    "documents" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "vehicles_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_vin_key" ON "public"."vehicles"("vin");
