# Docker Deployment Instructions

## Prerequisites
- Docker installed
- SSH key with access to private GitHub repo: `My-Safety/My-Safety-Design-System-Mobile`

## Build with SSH Key Accessdo

```bash
# Build with SSH agent forwarding
docker build --ssh default -t mysafety-web .

# Or build with specific SSH key
docker build --ssh default=$HOME/.ssh/id_rsa -t mysafety-web .
```

## Run Locally

```bash
docker run -p 8080:80 mysafety-web
```

Access at: http://localhost:8080

## Production Deployment

```bash
# Tag for registry
docker tag mysafety-web your-registry.com/mysafety-web:latest

# Push to registry
docker push your-registry.com/mysafety-web:latest
```

## Environment Variables (if needed)

Add to Dockerfile or pass during runtime:
```bash
docker run -p 8080:80 -e API_URL=https://api.example.com mysafety-web
```

## Files Included
- `Dockerfile` - Multi-stage build configuration
- `.dockerignore` - Excludes unnecessary files
- `nginx.conf` - Web server configuration
