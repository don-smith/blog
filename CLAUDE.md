# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo-based blog using the Paper theme, containerized with Docker for consistent development and deployment. The blog focuses on thoughts about software development and AI tooling changes.

## Development Commands

All development is done through Docker and Make commands with environment-specific configurations:

### Development Server
```bash
make dev
# Starts Hugo development server at localhost:1313 with live reload
# Uses docker-compose.dev.yml with baseURL http://localhost:1313
```

### Production Build
```bash
make build
# or
make build-prod
# Builds static site for production in ./public directory
# Uses docker-compose.prod.yml with baseURL https://dons.dev
```

### Testing Built Site Locally  
```bash
make serve-local
# Serves ./public on localhost:8000 using Python's built-in server
```

### Cleanup
```bash
make clean  
# Removes ./public and ./resources directories
```

### Help
```bash
make help
# Shows available Make targets with descriptions
```

## Architecture

- **Hugo Static Site Generator**: Uses Hugo with the Paper theme located in `themes/paper/`
- **Docker-based Development**: All Hugo commands run in containers with environment-specific configs:
  - `docker-compose.dev.yml`: Development with localhost:1313
  - `docker-compose.prod.yml`: Production with https://dons.dev baseURL
- **Content Structure**:
  - Blog posts in `content/posts/`
  - About page in `content/about/`
  - Static assets in `static/`
  - CNAME file in `static/CNAME` for custom domain
- **Configuration**: Main site config in `hugo.toml`
- **CI/CD**: GitHub Actions uses the same Docker production build process for consistency

## URL Configuration

**CRITICAL**: This blog uses a specific URL pattern for compatibility across environments. See `URL_GUIDELINES.md` for full details.

Key points:
- `baseURL = '/'` in `hugo.toml`  
- `relativeURLs = false` and `canonifyURLs = true`
- Always use relative paths starting with `/` (e.g., `/posts/my-post/`)
- Never hardcode domains or ports in content
- Use Hugo shortcodes for internal links: `{{< ref "filename.md" >}}`

## Content Guidelines

- Blog posts go in `content/posts/` with frontmatter including title, date, draft status, and categories
- Use Hugo markdown with frontmatter in YAML format
- Follow the URL guidelines when linking between content