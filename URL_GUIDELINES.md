# URL Guidelines

## Relative URLs Pattern

**IMPORTANT**: This blog uses relative URLs throughout to ensure compatibility across all environments (local development, production, different ports, subdomains, etc.).

## Configuration

In `hugo.toml`:
```toml
baseURL = '/'
relativeURLs = false
canonifyURLs = true
```

**Important**: 
- `relativeURLs = false` ensures CSS and assets use absolute paths (`/main.min.css`)
- `canonifyURLs = true` makes all URLs absolute from site root
- This prevents broken CSS/assets when navigating between different directory levels

## Content Guidelines

### ✅ DO
- Use relative paths: `/posts/my-post/`
- Use Hugo shortcodes for internal links: `{{< ref "my-post.md" >}}`
- Reference local development generically: "visit your local blog"
- Use menu URLs starting with `/`: `url = "/about/"`

### ❌ DON'T
- Hardcode absolute URLs: `https://example.com/posts/`
- Hardcode localhost URLs: `http://localhost:1313/posts/`
- Use port-specific URLs in content
- Use domain-specific URLs in development content

## Benefits
- Works in development (any port)
- Works in production (any domain)
- Works with GitHub Pages
- Works with custom domains
- No environment-specific configuration needed

## Future Maintenance
When adding new content or configuration:
1. Always use relative URLs
2. Test in both development and production environments
3. Never hardcode domains or ports in content files
4. Keep baseURL as '/' for maximum flexibility