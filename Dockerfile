FROM rockylinux:9

# Install Apache (httpd)
RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all

# Copy website files to Apache's root directory
ADD . /var/www/html

# Expose port 80 if needed
EXPOSE 80

# Run Apache in the foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
