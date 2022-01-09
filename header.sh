echo '> Github Overview'

if [[ -d "./__generate/node_modules" ]];
then
    echo '> Check Dependencies'
else
    ( cd __generate ; npm install )
fi

echo '> Header'
ruby ./__generate/header.rb
node ./__generate/header-check.js