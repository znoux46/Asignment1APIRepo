# Products Management E-commerce Application

A full-stack e-commerce web application built with Next.js frontend and .NET Core Web API backend, featuring user authentication, product management, shopping cart, and order processing.

## Features

### Authentication
- User registration and login
- JWT-based authentication
- Protected routes for authenticated users

### Product Management
- View all products (public)
- Create, edit, delete products (authenticated users only)
- Image upload using Cloudinary
- Search and pagination

### Shopping Cart
- Add/remove products from cart
- Update quantities
- Persistent cart storage

### Order Management
- Place orders from cart
- Order history
- Payment simulation
- Order status tracking

### UI Features
- Responsive design
- Modern, clean interface
- Real-time updates
- Error handling

## Tech Stack

### Frontend
- Next.js 14
- TypeScript
- Tailwind CSS
- React Server Components

### Backend
- .NET 8 Web API
- Entity Framework Core
- PostgreSQL
- JWT Authentication
- Cloudinary (image storage)

## Getting Started

### Prerequisites
- Node.js 18+
- .NET 8 SDK
- PostgreSQL
- Docker (optional)

### Local Development

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Products_Management
   ```

2. Set up the backend:
   ```bash
   cd Products_Management
   dotnet restore
   dotnet ef database update
   dotnet run
   ```

3. Set up the frontend:
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

4. Access the application:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5218

### Using Docker

```bash
docker-compose up
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login

### Products
- `GET /api/products` - Get all products
- `GET /api/products/{id}` - Get product by ID
- `POST /api/products` - Create product (authenticated)
- `PUT /api/products/{id}` - Update product (authenticated)
- `DELETE /api/products/{id}` - Delete product (authenticated)

### Cart
- `GET /api/cart` - Get user's cart (authenticated)
- `POST /api/cart` - Add item to cart (authenticated)
- `PUT /api/cart/{productId}` - Update cart item quantity (authenticated)
- `DELETE /api/cart/{productId}` - Remove item from cart (authenticated)
- `POST /api/cart/checkout` - Checkout cart (authenticated)

### Orders
- `GET /api/orders/me` - Get user's orders (authenticated)
- `POST /api/orders/{orderId}/pay` - Process payment (authenticated)

## Environment Variables

### Backend
```
CONNECTION_STRING_FROM_ENV=Host=localhost;Database=products_management;Username=postgres;Password=postgres
JWT_SECRET_FROM_ENV=your-secret-key
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
```

### Frontend
```
NEXT_PUBLIC_API_BASE_URL=http://localhost:5218
```

## Deployment

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed deployment instructions.

## Project Structure

```
Products_Management/
├── frontend/                 # Next.js frontend
│   ├── src/
│   │   ├── app/             # App router pages
│   │   ├── lib/             # API and auth utilities
│   │   └── components/      # React components
│   └── package.json
├── Products_Management/      # .NET backend
│   ├── API/                 # Controllers, services, models
│   ├── Migrations/          # Database migrations
│   └── Program.cs
├── docker-compose.yml       # Local development setup
└── README.md
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is for educational purposes as part of an assignment.