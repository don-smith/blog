.PHONY: dev build clean deploy help

dev: ## Start development server with live reload
	docker-compose up hugo

build: ## Build static site for production
	docker-compose --profile build run --rm hugo-build

clean: ## Clean generated files
	rm -rf public resources

deploy: build ## Build and deploy (run this in CI)
	@echo "Built site ready for deployment in ./public"

serve-local: ## Serve built site locally for testing
	cd public && python3 -m http.server 8000

help: ## Show this help message
	@echo 'Usage: make <target>'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)