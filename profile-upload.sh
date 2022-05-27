#!/bin/bash

echo "A. Create Headers"
ruby ./__generate/header.rb
ruby ./__generate/profile_headlines.rb

echo "B. Generate Profile"
ruby ./__generate/profile.rb

echo "C. Upload to Github"
git add .
git commit -m 'update banner'
git push -u origin main --force