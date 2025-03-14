# Step 1: Use official Nginx image from the Docker Hub for ARM64 architecture
FROM --platform=linux/arm64 nginx:alpine

# Step 2: Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Step 3: Copy all application files (HTML, CSS, JS) into the Nginx directory
COPY . .

# Step 4: Expose port 9003 (since we're modifying Nginx to listen on 9003)
EXPOSE 9003

# Step 5: Change Nginx default configuration to listen on port 9003
RUN sed -i 's/listen       80;/listen 9003;/' /etc/nginx/conf.d/default.conf

# Step 6: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
