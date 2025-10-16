# Stripe Payment Integration Setup

This document explains how to set up Stripe payment processing for the Products Management application.

## Backend Configuration

### 1. Install Dependencies
The Stripe .NET package has been added to `Products_Management.csproj`:
```xml
<PackageReference Include="Stripe.net" Version="45.0.0" />
```

### 2. Environment Variables
Add the following environment variables to your backend configuration:

**For Development (appsettings.Development.json):**
```json
{
  "Stripe": {
    "PublishableKey": "pk_test_your_stripe_publishable_key",
    "SecretKey": "sk_test_your_stripe_secret_key",
    "WebhookSecret": "whsec_your_webhook_secret"
  }
}
```

**For Production (appsettings.json):**
```json
{
  "Stripe": {
    "PublishableKey": "${STRIPE_PUBLISHABLE_KEY}",
    "SecretKey": "${STRIPE_SECRET_KEY}",
    "WebhookSecret": "${STRIPE_WEBHOOK_SECRET}"
  }
}
```

### 3. Stripe Account Setup
1. Create a Stripe account at https://stripe.com
2. Get your API keys from the Stripe Dashboard:
   - Publishable key (starts with `pk_test_` for test mode)
   - Secret key (starts with `sk_test_` for test mode)
3. Set up webhook endpoints for production

## Frontend Configuration

### 1. Install Dependencies
The Stripe React components have been added to `package.json`:
```json
{
  "@stripe/stripe-js": "^4.4.0",
  "@stripe/react-stripe-js": "^2.4.0"
}
```

### 2. Environment Variables
Create a `.env.local` file in the frontend directory:
```
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key_here
```

## API Endpoints

The following new endpoints have been added:

### Create Payment Intent
- **POST** `/api/payments/create-payment-intent`
- **Body:** `{ "orderId": number, "amount": number, "currency": "usd" }`
- **Response:** `{ "clientSecret": string, "paymentIntentId": string }`

### Confirm Payment
- **POST** `/api/payments/confirm-payment`
- **Body:** `{ "paymentIntentId": string }`
- **Response:** Order details

### Webhook (for production)
- **POST** `/api/payments/webhook`
- Handles Stripe webhook events for payment confirmation

## Testing

### Test Card Numbers
Use these test card numbers for testing:

- **Successful payment:** 4242 4242 4242 4242
- **Declined payment:** 4000 0000 0000 0002
- **Requires authentication:** 4000 0025 0000 3155

Use any future expiry date and any 3-digit CVC.

### Test Flow
1. Add items to cart
2. Go to checkout page
3. Click "Proceed to Payment"
4. Enter test card details
5. Complete payment

## Security Notes

- Never expose secret keys in frontend code
- Use environment variables for all sensitive configuration
- Implement webhook signature verification for production
- Use HTTPS in production
- Validate all payment data on the backend

## Production Deployment

1. Replace test keys with live keys
2. Set up webhook endpoints in Stripe Dashboard
3. Configure webhook secret
4. Test with real payment methods
5. Monitor payment logs and errors

## Troubleshooting

### Common Issues
1. **"Invalid API key"** - Check that the correct keys are configured
2. **"Payment failed"** - Verify card details and amount
3. **CORS errors** - Ensure backend CORS is configured for frontend domain
4. **Webhook not working** - Check webhook URL and secret

### Debug Steps
1. Check browser console for JavaScript errors
2. Check backend logs for API errors
3. Verify Stripe Dashboard for payment attempts
4. Test with Stripe CLI for webhook testing
