# react front 
FROM  node:8.17.0-alpine

WORKDIR /app

COPY . .

# Install dependencies
RUN npm install -f


# Build the React app
RUN npm run build

# Expose a port (change if necessary)
EXPOSE 9000

# Set the command to run when the container starts
CMD ["npm", "run","serve:dev"] 
