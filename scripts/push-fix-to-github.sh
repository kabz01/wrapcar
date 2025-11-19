#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Fixing Vercel configuration and pushing to GitHub...${NC}"

# 1. Add the updated vercel.json
git add vercel.json

# 2. Commit the change
git commit -m "fix: remove conflicting builds/functions config from vercel.json"

# 3. Push to GitHub
echo -e "${YELLOW}Pushing changes to origin main...${NC}"
git push origin main

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Success! Changes pushed to GitHub.${NC}"
    echo -e "${GREEN}👉 Go back to Vercel and try importing/deploying again.${NC}"
else
    echo -e "${RED}❌ Failed to push to GitHub.${NC}"
    echo -e "${YELLOW}Try running: git push origin main --force${NC}"
fi
