# Use official Node.js image as the base image
FROM node:latest

# Set the working directory
WORKDIR /app

# Install SQLite
RUN apt-get update && apt-get install -y sqlite3

# Install global dependencies
RUN npm install -g @nestjs/cli

# Create a new NestJS project
RUN nest new nestjs-prisma-demo --skip-install --package-manager npm --language TypeScript

# Move into the created project directory
WORKDIR /app/nestjs-prisma-demo

# Install project dependencies
RUN npm install

# Install Prisma
RUN npm install prisma --save-dev

# Initialize Prisma
RUN npx prisma init

# Copy the rest of the application code into the working directory
COPY files/schema.prisma ./prisma/schema.prisma

# Install Prisma generator libraries and dependencies
RUN npm install --save-dev @trxn/prisma-nestjs-graphql-resolvers-generator @trxn/prisma-nestjs-services-generator prisma-nestjs-graphql
RUN npm install --save @nestjs/apollo @nestjs/graphql @paljs/plugins @prisma/client @trxn/nestjs-database @trxn/nestjs-graphql prisma

# Generate NestJS services and DTOs
RUN npx prisma generate

# Set up the database using Prisma
RUN npx prisma db push

# Copy the rest of the application code into the working directory
COPY files/*.ts ./src/

# Expose the application's port
EXPOSE 3000

# Start the NestJS application
CMD ["npm", "run", "start:dev"]
