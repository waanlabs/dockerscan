FROM docker:latest

# Install Docker CLI and other necessary tools
RUN apk add --no-cache \
    bash \
    git

# Copy and set permission for entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
