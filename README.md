# Contriboot Rails

This is a contribution tool built specifically for the Ruby Unconf Hamburg 2018. It is heavily inspired by the [JSUnconf.eu Contriboot](https://github.com/jsunconf/2017.contriboot) but written from scratch in Ruby on Rails, as it should be :)

It was generated using a [Rails App Composer](https://github.com/RailsApps/rails_apps_composer) template for GitHub authentication and also for styling via Bootstrap/Sass.

If you find any problems, please [create an issue](https://github.com/rughh/contriboot-rails/issues) or send a pull request.

## Run locally

- check for ruby version in `.ruby-version`
- `bundle install`
- `rake db:create`
- `bin/rails db:migrate RAILS_ENV=development`
- `bundle exev rails s`

You should see the app running at <http://0.0.0.0:3000>

![image](https://user-images.githubusercontent.com/170145/39667699-3bb4cb0c-50bc-11e8-8e67-e9bbae84e5e1.png)

To add GitHub authentication locally, you'll need to create a GitHub OAuth app (go to Settings/Developer settings/OAuth Apps on GitHub and click "new OAuth app"), with "http://localhost:3000/auth/github/callback" as the Authorization Callback URL. Every other setting is irrelevant, just type in some useful stuff. You need to jot down the Client ID and Client Secret and then create an .env file in the project root, with the following content:

```
GH_PROVIDER_KEY=#{client_id}
GH_PROVIDER_SECRET=#{client secret}
```

## Hosting

Hosting is sponsored by [Depfu](https://depfu.com) and the app runs on a hobby dyno on Heroku.

If you need deployment permissions, please contact @halfbyte on Slack.
