# Car Dealership Management System

A comprehensive web-based management system for car dealerships built with Next.js 15, TypeScript, and PostgreSQL. This system handles inventory management, sales tracking, employee management, payroll, GPS tracking, and financial reporting.

## Features

- **Inventory Management**: Track vehicles, calculate bond rent, manage stock levels
- **Sales Management**: Handle cash and credit sales, payment tracking, customer management
- **Employee Management**: Staff database, biometric attendance, payroll automation
- **Financial Tracking**: Profit/loss calculations, expense tracking, reporting
- **GPS Tracking**: Real-time vehicle location monitoring for credit sales
- **Role-based Access Control**: Admin, Manager, Salesperson, Accountant, Staff roles
- **Comprehensive Reporting**: PDF/Excel exports, business analytics
- **Real-time Updates**: Live dashboards and notifications


## Tech Stack

- **Frontend**: Next.js 15 (App Router), TypeScript, Tailwind CSS
- **UI Components**: shadcn/ui, Radix UI
- **Backend**: Next.js API Routes, Server Actions
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: NextAuth.js v5
- **State Management**: Zustand, TanStack Query
- **Forms**: React Hook Form with Zod validation
- **Charts**: Recharts
- **Testing**: Jest, React Testing Library, Playwright


## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v20.9 or later)
- **npm** or **yarn** or **pnpm**
- **Docker** and **Docker Compose**
- **Git**

## Database Setup with Docker

### 1. Start Database Services

```bash
    # Start PostgreSQL and related services
    docker-compose up -d

    # Check if services are running
    docker-compose ps

    # View logs if needed
    docker-compose logs postgres
```



