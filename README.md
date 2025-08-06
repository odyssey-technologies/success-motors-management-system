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
    docker compose up -d

    # Check if services are running
    docker compose ps

    # View logs if needed
    docker compose logs postgres
```

### 2. Verify Database Connection

```bash
    # Connect to PostgreSQL container
    docker exec -it car_dealership_db psql -U dealership_user -d car_dealership_db

    # Inside PostgreSQL shell, run:
    \l  # List databases
    \q  # Quit
```

## Project Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd car-dealership-system
```

### 2. Install Dependencies

```bash
# Using npm
npm install

# Using bun -> preferred for speed
bun install

```

### 3. Environment Configuration

Create a `.env.local` file in the project root:

```bash
# Database Configuration
DATABASE_URL="postgresql://dealership_user:dealership_password@localhost:5432/car_dealership_db"

# NextAuth Configuration
NEXTAUTH_SECRET="your-super-secret-key-here-change-in-production"
NEXTAUTH_URL="http://localhost:3000"

REDIS_URL="redis://localhost:6379"

# Development/Production Flag
NODE_ENV="development"
```

### 4. Database Migration and Seeding

```bash

# Run database migrations
npx prisma migrate dev --name init

# Seed the database with initial data
npm run db:seed

# Optional: Open Prisma Studio to view data
npx prisma studio

# Reset database (This deletes all data)
npx prisma migrate reset

# Generate client after schema changes
npx prisma generate
```

### Database Backup and Restore

```bash
# Backup database
docker exec car_dealership_db pg_dump -U dealership_user car_dealership_db > backup.sql

# Restore database
docker exec -i car_dealership_db psql -U dealership_user car_dealership_db < backup.sql
```

## Development Workflow

### Code Quality and Formatting

```bash
# Lint code
bun run lint

# Fix linting issues
bun run lint:fix

# Format code with Prettier
bun run format

# Type check
bun run type-check
```

### Git Hooks (Husky)

The project uses Husky for Git hooks:

- **Pre-commit**: Runs linting and formatting
- **Pre-push**: Runs tests
- **Commit-msg**: Validates commit message format

### Commit Message Convention

Follow conventional commits:

```bash
feat: add vehicle inventory management
fix: resolve payment calculation bug
docs: update API documentation
style: format code with prettier
refactor: restructure database queries
test: add unit tests for sales module
chore: update dependencies
```

### Development Guidelines

- Follow TypeScript best practices
- Write tests for new features
- Update documentation for API changes
- Follow the established code style
- Use conventional commit messages

## Troubleshooting

### Common Issues

#### Database Connection Issues

```bash
# Check if PostgreSQL is running
docker-compose ps

# Check PostgreSQL logs
docker-compose logs postgres

# Restart PostgreSQL
docker-compose restart postgres
```

#### Migration Issues

```bash
# Reset database (⚠️ This deletes all data)
npx prisma migrate reset

# Generate client after schema changes
npx prisma generate
```

#### Port Conflicts

```bash
# Check what's using port 5432
lsof -i :5432

# Kill process using port
kill -9 <PID>
```

Github URL:

```bash
https://github.com/odyssey-technologies/success-motors-management-system
```
