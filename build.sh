#!/bin/bash
jekyll contentful --rebuild
ALGOLIA_INDEX_NAME=$ALGOLIA_INDEX_NAME_QUESTIONS jekyll algolia
ALGOLIA_INDEX_NAME=$ALGOLIA_INDEX_NAME_GLOSSARY jekyll algolia --config _config-glossary.yml
