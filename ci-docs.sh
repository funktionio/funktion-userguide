#!/usr/bin/env bash
echo ============================================
echo Deploying the documentation
echo ============================================

cd docs && \
mvn -Phtml,pdf package && \
git clone -b gh-pages https://jstrachan:${GITHUB_TOKEN}@github.com/funktionio/website.git gh-pages && \
git config --global user.email "travis@fabric8.io" && \
git config --global user.name "Travis" && \
mkdir -p gh-pages/docs && \
cp -rv target/generated-docs/* gh-pages/docs && \
cd gh-pages/docs && \
mv index.pdf userguide.pdf && \
git add --ignore-errors * && \
git commit -m "generated documentation" && \
git push origin master && \
cd ../.. && \
rm -rf gh-pages target
