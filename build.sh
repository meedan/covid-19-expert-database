#!/bin/bash
ALGOLIA_INDEX_NAME=$ALGOLIA_INDEX_NAME_QUESTIONS bundle exec jekyll algolia
ALGOLIA_INDEX_NAME=$ALGOLIA_INDEX_NAME_GLOSSARY bundle exec jekyll algolia --config _config-glossary.yml
