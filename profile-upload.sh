#!/bin/bash

echo "Create Headers"
ruby ./__generate/profile_headlines.rb

echo "Generate Profile"
ruby ./__generate/profile.rb

echo "Upload to Github"
git add .
git commit -m 'update banner'
git push -u origin main --force