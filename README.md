# This is a build system for Covid-19 Expert Database

This environment uses Jekyll with Contentful, Airtable and Algolia. For Contentful, it uses Contentful's [Jekyll-Contentful-Data-Import](https://github.com/contentful/jekyll-contentful-data-import) plugin. See the readme on the repository page to learn how to configure data import.

For Airtable, it uses a modified version of [Airtable Fetch](https://github.com/calebhicks/jekyll-airtable-utilities) plugin. 

And for Algolia, it uses [Jekyll Algolia Plugin](https://github.com/algolia/jekyll-algolia). It's documentation outlines [how to configure](https://community.algolia.com/jekyll-algolia/getting-started.html) the plugin and how to [send only the relevant data](https://community.algolia.com/jekyll-algolia/options.html#files-to-exclude) and how to [theme the search ui](https://community.algolia.com/jekyll-algolia/blog.html).


## Quick start
1. Install Ruby 2.x (eg with [rvm](https://rvm.io))
2. `bundle install` or `bundle install --path vendor/bundle` to install all the packages
3. Set environment variables to your shell's configuration file (.bashrc or .bash_profile) for contentful, airtable and algolia:

```
export CONTENTFUL_M_SPACE_ID=abc123
export CONTENTFUL_M_ACCESS_TOKEN=abc123
export CONTENTFUL_API_URL="cdn.contentful.com"
export ALGOLIA_APPLICATION_ID=abc123
export ALGOLIA_API_KEY=abc123
export ALGOLIA_SEARCH_ONLY_API_KEY=abc123
export ALGOLIA_INDEX_NAME_QUESTIONS=covid19_dev
export ALGOLIA_INDEX_NAME_GLOSSARY=covid19_glossary_dev
export AIRTABLE_API_KEY=abc123
export AIRTABLE_APP_ID=abc123
```

Plugins are configured in `_config.yml` and `_config-glossary.yml`. Get your Contentful space id and access token using the [Contentful web app](https://app.contentful.com/). Open the space that you want to access (the top left corner lists all spaces), and navigate to the *Settings > API keys*. Select the *API keys* option and there should be an existing API key under *Jekyll* for Covid-19 Expert Database.

Get the `AIRTABLE_API_KEY` from [your account](https://airtable.com/account) on Airtable and `AIRTABLE_APP_ID` from the source base.

For Algolia, get the credentials from your [dashboard](https://www.algolia.com/api-keys). Set develop environment variables for index names as `ALGOLIA_INDEX_NAME_QUESTIONS=covid19_dev` and `ALGOLIA_INDEX_NAME_GLOSSARY=covid19_glossary_dev`. For production, remove the `_dev` from them.

And run `source ~/.bashrc` or open new terminal to enable changes.

4. `./build.sh` to build the site by fetching content from Contentful, Airtable and sync indeces with Algolia. We are using two jekyll config files as we are sending data to two Algolia indeces and the plugin supports a single configuration at a time.
5. `jekyll serve` to serve the site at [http://127.0.0.1:4000](http://127.0.0.1:4000)
6. Edit .scss, .html and .js files. The browser should live-reload.

## Page Generation from Contentful and Airtable Data

To generate pages in Jekyll based on Contentful and airtable data we are using the [jekyll-datapage_gen](https://github.com/avillafiorita/jekyll-datapage_gen) plugin. Specify in `_config.yml` the data files for which you want individual page to be generated. See plugin's documentation and our `config.yml` for the settings.

All pages are generated using the `data_page_generator` plugin. See `config.yml` for its configuration.

## Deploy settings on Netlify

learnaboutcovid19.org is deployed on Netlify. Adding a website on Netlify is super easy. All these settings are under [Build & Deploy](https://app.netlify.com/sites/covid-19-expert-database/settings/deploys) section of [Netlify's web app](https://app.netlify.com). Here are the main steps:

1. Select which Github repository and branch to deploy.
2. Specify this build command: `./build.sh`
3. Set all the environment variables for contentful, airtable and algolia mentioned earlier.
4. Add build hook for Contentful's master and develop environment. Get the webhook urls using the [Contentful web app](https://app.contentful.com). Open the space and navigate to the *Settings > Webhooks*. You will see two webhooks already setup. See their details to copy the url or adjust what triggers it. See Contentful's [Intro to webhooks](https://www.contentful.com/developers/docs/concepts/webhooks/) to learn more.

See [Continuous Deployment](https://www.netlify.com/docs/continuous-deployment) on Netlify docs to learn more.