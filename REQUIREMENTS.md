Assignment 2 – E-Commerce Web App with Auth, Product, Cart, and Order Management
 
Objective
Build a clothing e-commerce website where users can register, log in, and manage products, cart, and orders:
This project should be focusing on:
-       Register/Login RESTful API development
-       User authentication
-       CRUD operations
-       Cart and order management
-       Dynamic UI updates
-       Deployment to a free hosting platform
Functional Requirements
1. Authentication
Users must be able to:
-   	Register with email and password
-   	Login to access their account
-   	Logout
-   	Use one of the following for authentication:
o   JWT with your own API
o   Supabase Auth (recommended if using Supabase DB)
-   	Only logged-in users can create, update, or delete products. Unauthenticated users can only view products.
2. Product Model
Each product must include:
-   	name (string, required)
-   	description (string, required)
-   	price (number, required)
-   	image (URL or upload, optional)
3. Cart Functionality
-   	Add product to cart (local state or database)
-   	View cart items with quantity and total price
-   	Remove item or update quantity
4. Order Management
-   	Place an order from the cart
-   	Order must be saved in the database
-   	Order model includes: userId, products, totalAmount, status
5. Optional: Payment Flow
-   	Simulate payment or integrate Stripe / Payos Checkout (recommended for bonus)
-   	After successful payment, update order status to "paid"
6. UI Requirements
-   	A homepage showing a list of products
-   	A product detail page
-   	A form to create and update products (only visible when logged in)
-   	UI to delete product (only visible when logged in)
-   	Navigation menu
-   	Register & Login Forms
-   	Logout Button
-   	Cart page: list products added
-   	Checkout page: confirm and place order
-   	Order history page: list past orders
-   	[Optional] Payment success screen
7. Optional UI Features (for bonus marks)
-   	Image upload (using Cloudinary or similar)
-   	Search/filter products
-   	Pagination
8. Deployment:
-       Deploy the application (Frontend + API) to a free hosting platform.
-       Ensure the database is accessible online (use free tiers of PostgreSQL or MongoDB Atlas).
-       Provide a working link to the deployed website + Github repo.
 
Deliverables
Submit the .doc/.docx file with format QE123456_Ass1.doc or QE123456_Ass1.docx contains:
-   	GitHub repository with source code (public)
-   	Deployed website link
 

