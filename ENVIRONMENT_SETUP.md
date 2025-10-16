# Environment Setup Guide

## 🔧 **Backend Configuration**

Your backend is already configured in `appsettings.Development.json` with the correct keys:

```json
{
  "Stripe": {
    "PublishableKey": "pk_test_YOUR_STRIPE_PUBLISHABLE_KEY",
    "SecretKey": "sk_test_YOUR_STRIPE_SECRET_KEY",
    "WebhookSecret": "whsec_YOUR_WEBHOOK_SECRET"
  }
}
```

## 🚀 **How to Apply the Changes**

1. **Update your `appsettings.Development.json`** with your actual Stripe keys
2. **Restart your backend** to apply the changes
3. **Test the payment flow** to ensure everything works

## 📝 **Important Notes**

- Use **test keys** for development
- Use **live keys** for production
- Keep your secret keys secure and never commit them to version control