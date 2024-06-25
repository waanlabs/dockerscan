# Use docker as the base image.
FROM docker:latest

# Dockblock.
LABEL author="waanlabs"
LABEL email="support@waanlabs.com"
LABEL description="Ubuntu Dev Container"
LABEL website="https://waanlabs.com"
LABEL origin="https://github.com/waanlabs/dockerscan"
LABEL version="0.9.0"
LABEL license="MIT"

# Install required packages.
RUN apk add --no-cache \
    bash \
    git \
    curl

# Install Trivy
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
