FROM node:22-alpine AS build
WORKDIR /app

# Copy only package files first (for caching)
COPY package*.json ./

# Install dependencies
# RUN npm ci for prod
RUN npm install

# Copy all source files (React app)
COPY . .

# Expose React dev server port
EXPOSE 5173

# Default command for prod
CMD ["npm", "run", "dev", "--", "--host"]