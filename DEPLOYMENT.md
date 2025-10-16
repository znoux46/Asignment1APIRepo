# Deployment Guide

This guide covers deploying the Products Management E-commerce application to free hosting platforms.

## Prerequisites

1. GitHub repository with the source code
2. Free accounts on hosting platforms
3. Environment variables configured

## Backend Deployment (Railway/Render)

### Option 1: Railway (Recommended)

1. Go to [Railway.app](https://railway.app)
2. Sign up with GitHub
3. Create a new project
4. Connect your GitHub repository
5. Add PostgreSQL database service
6. Set environment variables:
   ```
   CONNECTION_STRING_FROM_ENV=<postgres-connection-string>
   JWT_SECRET_FROM_ENV=<random-secret-key>
   CLOUDINARY_CLOUD_NAME=<your-cloudinary-cloud-name>
   CLOUDINARY_API_KEY=<your-cloudinary-api-key>
   CLOUDINARY_API_SECRET=<your-cloudinary-api-secret>
   ```
7. Deploy the backend

### Option 2: Render

1. Go to [Render.com](https://render.com)
2. Sign up with GitHub
3. Create a new Web Service
4. Connect your GitHub repository
5. Add PostgreSQL database
6. Set the same environment variables as above
7. Deploy

## Frontend Deployment (Vercel)

1. Go to [Vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Import your repository
4. Set environment variables:
   ```
   NEXT_PUBLIC_API_BASE_URL=https://your-backend-url.railway.app
   ```
5. Deploy

## Database Setup

1. Run migrations on your deployed database:
   ```bash
   # Connect to your production database and run:
   dotnet ef database update
   ```

## Environment Variables

### Backend
- `CONNECTION_STRING_FROM_ENV`: PostgreSQL connection string
- `JWT_SECRET_FROM_ENV`: Random secret for JWT signing
- `CLOUDINARY_CLOUD_NAME`: Cloudinary cloud name
- `CLOUDINARY_API_KEY`: Cloudinary API key
- `CLOUDINARY_API_SECRET`: Cloudinary API secret

### Frontend
- `NEXT_PUBLIC_API_BASE_URL`: Your deployed backend URL

## Cloudinary Setup (Optional)

1. Go to [Cloudinary.com](https://cloudinary.com)
2. Create a free account
3. Get your cloud name, API key, and API secret
4. Set them as environment variables

## Local Development

1. Clone the repository
2. Set up environment variables in `.env.local` files
3. Run with Docker Compose:
   ```bash
   docker-compose up
   ```

## Testing Deployment

1. Visit your frontend URL
2. Register a new account
3. Add products (requires login)
4. Add items to cart
5. Place an order
6. Test payment simulation

## Troubleshooting

### Common Issues

1. **CORS errors**: Ensure backend CORS is configured for your frontend domain
2. **Database connection**: Verify connection string and database exists
3. **JWT errors**: Ensure JWT secret is set and consistent
4. **Image upload**: Verify Cloudinary credentials

### Logs

- Railway: Check deployment logs in dashboard
- Render: Check logs in service dashboard
- Vercel: Check function logs in dashboard

## Security Notes

1. Change default JWT secret in production
2. Use HTTPS in production
3. Set up proper CORS origins
4. Consider rate limiting for production use
