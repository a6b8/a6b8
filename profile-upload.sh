#!/bin/bash
ruby ./__generate/profile.rb
git add .
git commit -m 'update banner'
git push -u origin main