FROM php:7.4

WORKDIR /var/www/html

# ... other Dockerfile instructions ...

# Install global Composer dependencies
RUN composer global require hirak/prestissimo

# Copy the application files
COPY . /var/www/html

# Install Composer dependencies
RUN composer install --no-dev

# Cache configuration and routes
RUN php artisan config:cache
RUN php artisan route:cache

# Run migrations
RUN php artisan migrate --force
