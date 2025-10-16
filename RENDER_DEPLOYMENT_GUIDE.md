# Render Deployment Guide - Environment Variables Setup

## Overview
This guide shows how to configure environment variables for your .NET Core backend deployment on Render.

## Environment Variables to Set in Render Dashboard

### 1. Database Configuration
```
DB_HOST=your-postgres-host
DB_PORT=5432
DB_NAME=your-database-name
DB_USER=your-username
DB_PASSWORD=your-password
```

### 2. JWT Configuration
```
JWT_SECRET=your-super-secure-jwt-secret-key-here
```

### 3. Cloudinary Configuration
```
CLOUDINARY_CLOUD_NAME=your-cloudinary-cloud-name
CLOUDINARY_API_KEY=your-cloudinary-api-key
CLOUDINARY_API_SECRET=your-cloudinary-api-secret
```

### 4. Stripe Configuration
```
STRIPE_PUBLISHABLE_KEY=pk_live_your_live_publishable_key
STRIPE_SECRET_KEY=sk_live_your_live_secret_key
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret
```

## How to Set Environment Variables in Render

### Step 1: Access Environment Variables
1. Go to your Render dashboard
2. Select your service
3. Go to the "Environment" tab
4. Click "Add Environment Variable"

### Step 2: Add Each Variable
For each variable above:
1. **Key**: Enter the variable name (e.g., `JWT_SECRET`)
2. **Value**: Enter the actual value
3. Click "Save Changes"

### Step 3: Redeploy
After adding all environment variables:
1. Go to the "Deploys" tab
2. Click "Manual Deploy" → "Deploy latest commit"

## Important Notes

### Database Setup
- **For Production**: Use Render's PostgreSQL service or external database
- **Connection String**: Will be automatically constructed from the DB_* variables

### Security
- **JWT_SECRET**: Use a long, random string (at least 32 characters)
- **Stripe Keys**: Use LIVE keys for production (not test keys)
- **Database Password**: Use a strong, unique password

### Environment Variable Priority
Render will override your `appsettings.json` values with environment variables when they exist.

## Troubleshooting

### Common Issues
1. **Missing Environment Variables**: Check that all required variables are set
2. **Database Connection**: Verify DB_* variables are correct
3. **JWT Issues**: Ensure JWT_SECRET is set and matches your frontend

### Testing Environment Variables
You can verify your environment variables are working by:
1. Adding a simple endpoint that returns configuration (for testing only)
2. Checking the Render logs for any configuration errors

## Example Environment Variables for Production

```
# Database
DB_HOST=your-render-postgres-host
DB_PORT=5432
DB_NAME=productmanagement
DB_USER=your-username
DB_PASSWORD=your-secure-password

# JWT
JWT_SECRET=your-super-secure-256-bit-secret-key-here

# Cloudinary
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret

# Stripe (Production Keys)
STRIPE_PUBLISHABLE_KEY=pk_live_51...
STRIPE_SECRET_KEY=sk_live_51...
STRIPE_WEBHOOK_SECRET=whsec_...
```

## Next Steps
1. Set up your database on Render
2. Configure all environment variables
3. Deploy your application
4. Test all functionality
5. Update your frontend to use the new backend URL
