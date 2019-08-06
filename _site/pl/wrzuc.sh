#!/usr/bin/env bash
set -e

if [ "$1" == "" ]; then
  echo "Podaj nazwe ksiazki (w cudzyslowie)"
  exit 1
fi

echo "Buduje posta"
JEKYLL_ENV=production bundle exec jekyll build
echo "Dodaje do gita"
git add -A

echo "Commituje"
git commit -m $1

echo "Kopiuje"
cp -vr _site/* ../temp

echo "Pushuje nowy-templout"
git push

echo "Checkoutuje mastera"
git checkout master

echo "Kopiuje na mastera"
cp -vr ../temp .

echo "Commituje mastera"
git commit -m $1

echo "Pushuje mastera"
git push

echo "Checkoutuje nowy template"
git checkout nowy-template
