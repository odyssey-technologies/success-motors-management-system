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

- **Node.js** (v18.17 or later)
- **npm** or **yarn** or **pnpm**
- **Docker** and **Docker Compose**
- **Git**

## Database Setup with Docker

### 1. Create Docker Compose File

Create a `docker-compose.yml` file in your project root:

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    container_name: car_dealership_db
    restart: unless-stopped
    environment:
      POSTGRES_DB: car_dealership_db
      POSTGRES_USER: dealership_user
      POSTGRES_PASSWORD: dealership_password
      PGDATA: /var/lib/postgresql/data/pgdata
    ports:
      - '5432:5432'
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./docker/postgres/init:/docker-entrypoint-initdb.d
    networks:
      - dealership_network

  # Optional: pgAdmin for database management
  pgadmin:
    image: dpage/pgadmin4:latest
    container_name: car_dealership_pgadmin
    restart: unless-stopped
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@cardealership.com
      PGADMIN_DEFAULT_PASSWORD: admin123
      PGADMIN_CONFIG_SERVER_MODE: 'False'
    ports:
      - '5050:80'
    volumes:
      - pgadmin_data:/var/lib/pgadmin
    networks:
      - dealership_network
    depends_on:
      - postgres

  # Optional: Redis for caching and sessions
  redis:
    image: redis:7-alpine
    container_name: car_dealership_redis
    restart: unless-stopped
    ports:
      - '6379:6379'
    volumes:
      - redis_data:/data
    networks:
      - dealership_network

volumes:
  postgres_data:
  pgadmin_data:
  redis_data:

networks:
  dealership_network:
    driver: bridge
```

### 2. Start Database Services

```shellscript
# Start PostgreSQL and related services
docker-compose up -d

# Check if services are running
docker-compose ps

# View logs if needed
docker-compose logs postgres
```

### 3. Verify Database Connection

```shellscript
# Connect to PostgreSQL container
docker exec -it car_dealership_db psql -U dealership_user -d car_dealership_db

# Inside PostgreSQL shell, run:
\l  # List databases
\q  # Quit
```

## Project Setup

### 1. Clone the Repository

```shellscript
git clone <repository-url>
cd car-dealership-system
```

### 2. Install Dependencies

```shellscript
# Using npm
npm install

# Using yarn
yarn install

# Using pnpm
pnpm install
```

### 3. Environment Configuration

Create a `.env.local` file in the project root:

```shellscript
# Database Configuration
DATABASE_URL="postgresql://dealership_user:dealership_password@localhost:5432/car_dealership_db"

# NextAuth Configuration
NEXTAUTH_SECRET="your-super-secret-key-here-change-in-production"
NEXTAUTH_URL="http://localhost:3000"

# Optional: Redis Configuration
REDIS_URL="redis://localhost:6379"

# Optional: External Service APIs
QUICKBOOKS_CLIENT_ID=""
QUICKBOOKS_CLIENT_SECRET=""
GPS_TRACKING_API_KEY=""
SMS_API_KEY=""
MOBILE_MONEY_API_KEY=""

# Optional: File Upload
UPLOAD_DIR="./uploads"
MAX_FILE_SIZE="10485760" # 10MB

# Optional: Email Configuration
SMTP_HOST=""
SMTP_PORT=""
SMTP_USER=""
SMTP_PASSWORD=""

# Development/Production Flag
NODE_ENV="development"
```

### 4. Database Migration and Seeding

```shellscript
# Generate Prisma client
npx prisma generate

# Run database migrations
npx prisma migrate dev --name init

# Seed the database with initial data
npm run db:seed

# Optional: Open Prisma Studio to view data
npx prisma studio
```

## ‍️ Running the Application

### Development Mode

```shellscript
# Start the development server
npm run dev

# The application will be available at:
# - Main App: http://localhost:3000
# - pgAdmin: http://localhost:5050 (if enabled)
# - Prisma Studio: http://localhost:5555 (when running)
```

### Production Build

```shellscript
# Build the application
npm run build

# Start production server
npm start
```

## Testing

### Unit and Integration Tests

```shellscript
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage
```

### End-to-End Tests

```shellscript
# Install Playwright browsers (first time only)
npx playwright install

# Run E2E tests
npm run test:e2e

# Run E2E tests in UI mode
npm run test:e2e:ui
```

## Database Management

### Common Prisma Commands

```shellscript
# Generate Prisma client after schema changes
npx prisma generate

# Create and apply new migration
npx prisma migrate dev --name migration_name

# Reset database (⚠️ This will delete all data)
npx prisma migrate reset

# Deploy migrations to production
npx prisma migrate deploy

# View database in browser
npx prisma studio

# Seed database
npm run db:seed
```

### Database Backup and Restore

```shellscript
# Backup database
docker exec car_dealership_db pg_dump -U dealership_user car_dealership_db > backup.sql

# Restore database
docker exec -i car_dealership_db psql -U dealership_user car_dealership_db < backup.sql
```

## Development Workflow

### Code Quality and Formatting

```shellscript
# Lint code
npm run lint

# Fix linting issues
npm run lint:fix

# Format code with Prettier
npm run format

# Type check
npm run type-check
```

### Git Hooks (Husky)

The project uses Husky for Git hooks:

- **Pre-commit**: Runs linting and formatting
- **Pre-push**: Runs tests
- **Commit-msg**: Validates commit message format

### Commit Message Convention

Follow conventional commits:

```shellscript
feat: add vehicle inventory management
fix: resolve payment calculation bug
docs: update API documentation
style: format code with prettier
refactor: restructure database queries
test: add unit tests for sales module
chore: update dependencies
```

## Project Structure

```plaintext
car-dealership-system/
├── prisma/
│   ├── migrations/          # Database migrations
│   ├── schema.prisma       # Database schema
│   └── seed.ts            # Database seeding script
├── src/
│   ├── app/               # Next.js App Router
│   │   ├── (auth)/        # Authentication pages
│   │   ├── (dashboard)/   # Main application pages
│   │   ├── api/           # API routes
│   │   ├── globals.css    # Global styles
│   │   ├── layout.tsx     # Root layout
│   │   └── page.tsx       # Home page
│   ├── components/        # Reusable components
│   │   ├── ui/            # shadcn/ui components
│   │   ├── forms/         # Form components
│   │   ├── tables/        # Table components
│   │   └── charts/        # Chart components
│   ├── lib/               # Utility libraries
│   │   ├── auth.ts        # Authentication config
│   │   ├── db.ts          # Database connection
│   │   ├── utils.ts       # General utilities
│   │   └── validations/   # Zod schemas
│   ├── hooks/             # Custom React hooks
│   ├── types/             # TypeScript type definitions
│   └── utils/             # Utility functions
├── tests/                 # Test files
│   ├── __mocks__/         # Test mocks
│   ├── e2e/               # E2E tests
│   └── unit/              # Unit tests
├── docker-compose.yml     # Docker services
├── next.config.mjs        # Next.js configuration
├── tailwind.config.ts     # Tailwind CSS configuration
├── tsconfig.json          # TypeScript configuration
└── package.json           # Dependencies and scripts
```

## Authentication & Authorization

### Default Users

After seeding, you can login with:

- **Username**: `admin`
- **Password**: `admin123`
- **Role**: Admin (full access)

### User Roles and Permissions

| Role            | Permissions                                               |
| --------------- | --------------------------------------------------------- |
| **Admin**       | Full system access, user management, system configuration |
| **Manager**     | All operations except user management and system config   |
| **Salesperson** | Vehicle sales, customer management, limited reporting     |
| **Accountant**  | Financial operations, payroll, expense management         |
| **Staff**       | Basic operations, attendance tracking                     |

## API Documentation

### Authentication Endpoints

```plaintext
POST /api/auth/signin     # User login
POST /api/auth/signout    # User logout
GET  /api/auth/session    # Get current session
```

### Vehicle Management

```plaintext
GET    /api/vehicles           # List all vehicles
POST   /api/vehicles           # Create new vehicle
GET    /api/vehicles/[id]      # Get vehicle details
PUT    /api/vehicles/[id]      # Update vehicle
DELETE /api/vehicles/[id]      # Delete vehicle
```

### Sales Management

```plaintext
GET    /api/sales              # List all sales
POST   /api/sales              # Create new sale
GET    /api/sales/[id]         # Get sale details
PUT    /api/sales/[id]         # Update sale
POST   /api/sales/[id]/payment # Add payment
```

### Employee Management

```plaintext
GET    /api/employees          # List all employees
POST   /api/employees          # Create new employee
GET    /api/employees/[id]     # Get employee details
PUT    /api/employees/[id]     # Update employee
POST   /api/attendance         # Record attendance
GET    /api/payroll            # Get payroll data
```

## Deployment

### Environment Variables for Production

```shellscript
# Production Database
DATABASE_URL="postgresql://user:password@production-host:5432/car_dealership_db"

# Security
NEXTAUTH_SECRET="production-secret-key"
NEXTAUTH_URL="https://yourdomain.com"

# External Services
QUICKBOOKS_CLIENT_ID="production-client-id"
GPS_TRACKING_API_KEY="production-api-key"
```

### Docker Production Deployment

Create `docker-compose.prod.yml`:

```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - '3000:3000'
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgresql://dealership_user:dealership_password@postgres:5432/car_dealership_db
    depends_on:
      - postgres
    networks:
      - dealership_network

  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: car_dealership_db
      POSTGRES_USER: dealership_user
      POSTGRES_PASSWORD: dealership_password
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - dealership_network

volumes:
  postgres_data:

networks:
  dealership_network:
```

### Deployment Commands

```shellscript
# Build and deploy
docker-compose -f docker-compose.prod.yml up -d

# Run migrations in production
docker-compose -f docker-compose.prod.yml exec app npx prisma migrate deploy
```

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
